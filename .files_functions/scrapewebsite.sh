#/bin/bash

__scrapewebsite() {
    wget --recursive --html-extension --no-parent --page-requisites --convert-links $1
}

alias scrapewebsite='__scrapewebsite'
alias sw='scrapewebsite'
alias scrape-website='sw'
alias scrape='sw'
