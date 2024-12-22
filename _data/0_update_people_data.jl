using Downloads
using DataFrames
using CSV
using TOML

# https://www.epfl.ch/campus/services/website/web-services/wordpress-help/list-of-blocks-en/people-en/

const IMAGES = joinpath(@__DIR__, "..", "_assets", "people")


function get_csv_data()
    csv1 = Downloads.download("https://search-api.epfl.ch/api/unit/csv?q=MATMAT1&hl=en")
    csv2 = Downloads.download("https://search-api.epfl.ch/api/unit/csv?q=MATMAT2&hl=en")
    df = append!(CSV.read(csv1, DataFrame), CSV.read(csv2, DataFrame); promote=true)
    df = unique(df, :Sciper)

    map(eachrow(df)) do row
        Dict("firstname" => getproperty(row, Symbol("First name")),
             "name"      => row.Name,
             "sciper"    => row.Sciper,
             "email"     => row.email,
             "position"  => row.Position,
             "room"      => getproperty(row, Symbol("Office(s)")),
             # "phone"     => getproperty(row, Symbol("Phone(s)")),
             # "address"   => row.Address,
       )
    end
end

function augment_defaults!(data::AbstractDict)
    priority_default = 0
    if get(data, "position", "") in ("Scientist", )
        priority_default = -20
    end

    get!(data, "priority",    priority_default)
    get!(data, "website",     "https://people.epfl.ch/$(data["sciper"])")
    get!(data, "gscholar",    "")
    get!(data, "orcid",       "")
    get!(data, "arxiv",       "")
    get!(data, "github",      "")
    get!(data, "destination", "")
    get!(data, "departure",   "")
    data
end

function normalised_from_email(s::AbstractString)
    beginning  = split(s, "@")[1]
    components = split(beginning, ".")
    join(reverse(components), "-")
end

function drop_image(data::AbstractDict; overwrite=false)
    key = normalised_from_email(data["email"])
    filename = joinpath(IMAGES, "$(key).jpg")
    if isfile(filename) && !overwrite
        return nothing
    end

    try
        url = "https://people.epfl.ch/private/common/photos/links/$(data["sciper"]).jpg"
        Downloads.download(url, filename)
   catch e
       if !(e isa Downloads.RequestError)
           rethrow()
       else
           if !isfile(filename) || overwrite
               cp(joinpath(IMAGES, "dummyimage.jpg"), filename)
           end
       end
   end
   nothing
end

function update_people_data(filename; overwrite=false)
    data = open(TOML.parse, filename)
    dkeys = collect(keys(data))

    for d in get_csv_data()
        idx = findfirst(k -> data[k]["sciper"] == d["sciper"], dkeys)
        if isnothing(idx)
            match = normalised_from_email(d["email"])
            data[match] = Dict{String,Any}()
        else
            match = dkeys[idx]
        end

        for k in keys(d)  # Update missing keys
            get!(data[match], k, d[k])
        end
        augment_defaults!(data[match])
        if overwrite  # Also modify old keys
            for k in keys(d)
                data[match][k] = d[k]
            end
        end
        drop_image(data[match]; overwrite)
    end

    open(filename, "w") do fp
        TOML.print(fp, data; sorted=true)
    end
end

function main()
    update_people_data(joinpath(@__DIR__, "people.toml"))
end

(abspath(PROGRAM_FILE) == @__FILE__) && main()
