using TOML
using Bibliography
using Bibliography: BibInternal
using Markdown: htmlesc

#
# Email protection
#

"""Insert a javascript blob for assembling emails"""
function hfun_email_unprotect_js()
    return """<script>
    function msgto(mailID, mailDomain) {
      var txt = mailID;
      txt = txt + "@" + mailDomain;
      document.write('<a href="mailto:'+ txt + '">' + txt + '</a>');
    }
    </script>"""
end

function protected_email_link(email::AbstractString)
    dest, domain = split(email, "@")
    ("""<script>msgto('$dest', '$domain')</script>""" *
     """<noscript>Enable JavaScript to see email</noscript>""")
end
hfun_protect_email(params) = protected_email_link(params[1])

#
# News
#

"""Get all news sorted by publication date"""
function news_sorted()
    all_articles = [joinpath(root, f)
                    for (root, dirs, files) in walkdir("news")
                    for f in files
                    if endswith(f, ".md") && root != "news"]

    by = function (article)
        pubdate = pagevar(article, :rss_pubdate)
        if isnothing(pubdate)
            m = match(r"([0-9]+)/([0-9]+)/[^/]+\.md", article)
            pubdate = Date(parse(Int, m[1]), parse(Int, m[2]), 1)
        end
        pubdate
    end
    sort(all_articles; by, rev=true)
end

"""Print a news article path"""
function print_news(io::IO, article)
    doprint = true
    for line in readlines(article)
        if !isnothing(match(r"^[+]+$", line))
            doprint = !doprint
            continue
        end
        doprint && println(io, line)
    end
end

"""
    {{allnews}}

Plug in all news articles contained in the `/news/` folder.
"""
@delay function hfun_allnews()
    io = IOBuffer()
    current_year = nothing
    for article in news_sorted()
        yr = year(pagevar(article, :rss_pubdate))
        if yr != current_year
            current_year = yr
            println(io, "## $yr")
        end
        print_news(io, article)
        println(io, "\n-------")
    end
    Franklin.fd2html(String(take!(io)); internal=true)
end


"""
    {{allnews}}

Plug in the highlighted news articles contained in `/news/` folder.
"""
@delay function hfun_firstpagenews()
    io = IOBuffer()
    count = 0
    firstpage_articles = filter(news_sorted()) do article
        on_startpage = something(pagevar(article, :startpage), false)
        type = something(pagevar(article, :type), "")
        pubdate  = something(pagevar(article, :rss_pubdate), Date(1, 1, 1))

        default_showdate = (type == "publication"
                            ? pubdate + Dates.Month(1)
                            : pubdate)
        showdate = something(pagevar(article, :showdate), default_showdate)

        force_show = false
        if pubdate > Dates.now()  # in the future
            force_show = true
        elseif showdate > Dates.now()  # should still show the article
            force_show = true
        end

        if on_startpage && (force_show || count < 3)
            count += 1
            return true
        end
        return false
    end
    for article in reverse(firstpage_articles)
        print_news(io, article)
        println(io, "\n-------")
    end
    println(io, "[[See all news]](news)")
    Franklin.fd2html(String(take!(io)); internal=true)
end


"""
    {{newsheader}}

Add a standard header to news pages
"""
function hfun_newsheader()
    if !isnothing(match(r"news/[0-9]+/[0-9]+", locvar("fd_rpath")))
        # We are deep inside the news directory
        #     -> Add title to make the page look nice
        #     -> Add some way for user to get back to news
        return """
        <h1>$(locvar("title"))</h1>
        <p><a href="/news">Other news articles</a></p>
        """
    else
        return ""
    end
end

#
# People list
#

function normalised_from_email(s::AbstractString)
    @assert endswith(s, "@epfl.ch")
    beginning  = split(s, "@")[1]
    components = split(beginning, ".")
    join(reverse(components), "-")
end

function roomlink(room::AbstractString)
    if isempty(room)
        room
    else
        """<a href="https://plan.epfl.ch/?room==$(htmlesc(room))">$room</a>"""
    end
end

function social_imagelink(key, value)
    linkprefix = Dict(
        "arxiv"    => "https://arxiv.org/a/",
        "orcid"    => "https://orcid.org/",
        "gscholar" => "https://scholar.google.com/citations?user=",
        "github"   => "https://github.com/",
    )
    linktext = Dict(
        "gscholar" => "Google Scholar",
        "arxiv"    => "ArXiv",
        "orcid"    => "ORCID",
    )

    io = IOBuffer()
    print(io, """<a href="$(get(linkprefix, key, ""))$value" >""")
    print(io, """<img class="social-logo" alt="$key" src="/assets/icons/$key.png"/>""")
    print(io, """$(get(linktext, key, uppercasefirst(key)))""")
    print(io, """</a>""")
    String(take!(io))
end

function people_row(data::AbstractDict; showroom=true, showemail=true, showdestination=true)
    maxsocial = 2

    io = IOBuffer()
    print(io, "<tr>")

    # Profile picture
    if haskey(data, "image") 
        imgkey = data["image"]
    elseif endswith(data["email"], "@epfl.ch")
        imgkey = normalised_from_email(data["email"])
    else
        error("Need to either have an epfl email or specify the 'image' key")
    end
    print(io, """<td><a href="$(data["website"])">""")
    print(io, """<img class="profile-img" src="/assets/people/$imgkey.jpg" />""")
    print(io, """</a></td>""")

    # Name, Email, Function, Office
    print(io, """<td><strong><a href="$(data["website"])">$(data["firstname"]) """ *
              """$(data["name"])</a></strong>""")
    print(io, """<br />$(data["position"])""")

    if showemail
        print(io, """<br /><span class="weak-text">Email:</span> """ *
                  """$(protected_email_link(data["email"]))""")
        maxsocial += 1
    end
    if showroom
        print(io, """<br /><span class="weak-text">Office:</span> """ *
                  """$(roomlink(data["room"]))""")
        maxsocial += 1
    end
    if haskey(data, "destination") && showdestination
        print(io, """<br /><span class="weak-text">Now:</span> """ *
                  """$(data["destination"])""")
        maxsocial += 1
    end
    print(io, """</td>""")

    # Social links
    print(io, "<td>")
    nsocial = 0
    for key in ["website", "gscholar", "orcid", "github", "arxiv"]
        value = get(data, key, "")
        if !isempty(value) && nsocial < maxsocial
            print(io, social_imagelink(key, value))
            nsocial += 1
            nsocial < maxsocial && print(io, "<br />")
        end
    end
    print(io, "<br />"^(maxsocial-nsocial))
    print(io, "</td>")

    print(io, "</tr>")
    String(take!(io))
end

function hfun_people_table()
    data = open(TOML.parse, "_data/people.toml", "r")
    people = sort(collect(values(data)), by=d -> (get(d, "priority", 0), d["name"]))

    io = IOBuffer()

    println(io, "<table>")
    for p in people
        p["current"] || continue
        println(io, people_row(p; showroom=true))
    end
    println(io, "</table>")

    if !all(p -> p["current"], people)
        println(io, "<h2>Former members</h2>")
        println(io, "<table>")
        for p in people
            p["current"] && continue
            println(io, people_row(p; showroom=false))
        end
        println(io, "</table>")
    end

    String(take!(io))
end

#
# Publications
#


function format_bibentry(entry::BibInternal.Entry)
    @assert entry.type == "article" || entry.type == "unpublished"
    io = IOBuffer()

    # TODO Highlight authors from my group

    # Format authors
    function format_name(s)
        join(filter(!isempty, [s.first, s.middle, s.particle, s.last, s.junior]), " ")
    end
    join(io, format_name.(entry.authors), ", ", " and ")
    print(io, ". ")
    print(io, "*[$(entry.title)]($(entry.access.url))*. ")

    if !isempty(entry.in.journal)
        # Published article
        print(io, entry.in.journal, " ")
        if !isempty(entry.in.volume)
            print(io, "**", entry.in.volume, "**")
            !isempty(entry.in.pages) && print(io, ", ", entry.in.pages)
        end
        print(io, " (", entry.date.year, ").")
    end

    if !isempty(entry.access.doi)
        print(io, " [DOI $(entry.access.doi)](https://doi.org/$(entry.access.doi))")
    end

    # TODO Code, data etc.

    String(take!(io))
end

function hfun_allpublications()
    biblio = collect(values(Bibliography.import_bibtex("_data/publications.bib")))
    biblio = sort(biblio, by=e -> Date(
        parse(Int, e.date.year),
        parse(Int, e.date.month),
        parse(Int, e.date.day),
    ), rev=true)
    io = IOBuffer()

    articles_unpublished = filter(e -> e.type == "unpublished", biblio)
    if !isempty(articles_unpublished)
        println(io, "## Under review")
        for entry in articles_unpublished
            println(io, "- ", format_bibentry(entry))
        end
    end

    println(io, "## Peer-reviewed articles")
    for entry in filter(e -> e.type == "article", biblio)
        # TODO Improve
        println(io, "- ", format_bibentry(entry))
    end
    Franklin.fd2html(String(take!(io)); internal=true)
end
