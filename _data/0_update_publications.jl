using JSON3
using Downloads
using Infiltrator

function get_json_data()
    json1 = Downloads.download("https://infoscience.epfl.ch/search?c=Infoscience%2FResearch%2FSB%2FMATH%2FMATMAT1&of=recjson")
    json2 = Downloads.download("https://infoscience.epfl.ch/search?c=Infoscience%2FResearch%2FSB%2FMATH%2FMATMAT2&of=recjson")
    data = append!(convert(Vector, open(JSON3.read, json1)),
                   open(JSON3.read, json2))

    unique_keyset = map(data) do d
        keys = sort(d[:persistent_identifiers_keys])
        Dict(k => d[k] for k in keys)
    end
    unique_keyset = unique(unique_keyset)

    result = map(unique_keyset) do keyset
        for d in data
            if all(d[k] == v for (k, v) in pairs(keyset))
                return d
            end
        end
        nothing
    end
    filter(!isnothing, result)
end





#=

Lists of recent publications on infoscience:
link to publisher websites and arxiv pdfs

have also a subfolder with bib files for preprints

=#
