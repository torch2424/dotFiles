#/bin/bash

scrapewebsite() {
    wget --recursive --html-extension --no-parent --page-requisites --convert-links $1
}

alias sw='scrapewebsite'
alias scrape-website='sw'
alias scrape='sw'
