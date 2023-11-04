using TOML
using Markdown: htmlesc

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
    firstpage_articles = filter(news_sorted()) do article
        startpage = pagevar(article, :startpage)
        startpage !== nothing && startpage
    end
    for article in firstpage_articles[1:min(3, end)]
        print_news(io, article)
        println(io, "\n-------")
    end
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

function normalised_from_email(s::AbstractString)
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

function people_row(data::AbstractDict; showroom=true)
    maxsocial = showroom ? 4 : 3

    io = IOBuffer()
    print(io, "<tr>")

    # Profile picture
    imgkey = normalised_from_email(data["email"])
    print(io, """<td><a href="$(data["website"])">""")
    print(io, """<img class="profile-img" src="/assets/people/$imgkey.jpg" />""")
    print(io, """</a></td>""")

    # Name, Email, Function, Office
    print(io, """<td><strong><a href="$(data["website"])">$(data["firstname"]) """ *
              """$(data["name"])</a></strong>""")
    print(io, """<br />$(data["position"])""")
    print(io, """<br /><span class="weak-text">Email:</span> """ *
              """$(protected_email_link(data["email"]))""")
    if showroom
        print(io, """<br /><span class="weak-text">Office:</span> """ *
                  """$(roomlink(data["room"]))""")
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
    data   = open(TOML.parse, "_data/people.toml", "r")
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
