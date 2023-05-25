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
            pubdate = Date(parse(Int, m[2]), parse(Int, m[1]), 1)
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
function hfun_allnews()
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
function hfun_firstpagenews()
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
