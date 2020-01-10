#!/bin/bash

ruby scrape_title_2.rb movie > data/movie.txt
echo 'movie is done'
ruby scrape_title_2.rb social-insurance > data/social-insurance.txt
echo 'social-insurance is done'
ruby scrape_title_2.rb notary-public > data/notary-public.txt
echo 'notary-public is done'
