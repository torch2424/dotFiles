#!/bin/bash

# Use --expand to add more domainss
sudo letsencrypt certonly --standalone -d aaronthedev.com -d files.aaronthedev.com -d mongo.aaronthedev.com -d blog.aaronthedev.com -d git.aaronthedev.com -d testbuild.aaronthedev.com
