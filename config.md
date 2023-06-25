<!--
Add here global page variables to use throughout your website.
-->
+++
mintoclevel = 2
author = "Michael F. Herbst"
prepath     = ""

# Add here files or directories that should be ignored by Franklin, otherwise
# these files might be copied and, if markdown, processed by Franklin which
# you might not want. Indicate directories by ending the name with a `/`.
# Base files such as LICENSE.md and README.md are ignored by default.
ignore = ["node_modules/"]

# RSS (the website_{title, descr, url} must be defined to get RSS)
generate_rss  = false
website_title = "Mathematics for Materials Modelling group"
website_url   = "https://matmat.org"
website_descr = "News from the Mathematics for Materials Modelling group at EPFL."
+++

<!--
Add here global latex commands to use throughout your pages.
-->
\newcommand{\R}{\mathbb R}
\newcommand{\scal}[1]{\langle #1 \rangle}
\newcommand{\style}[2]{~~~<span style="!#1">!#2</span>~~~}
\newcommand{\newline}{~~~<br />~~~}
