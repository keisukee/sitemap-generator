#!/bin/bash

ruby scrape_title.rb tax-accountant > data/tax-accountant.txt
echo 'tax-accountant is done'
ruby scrape_title.rb movie > data/movie.txt
echo 'movie is done'
ruby scrape_title.rb social-insurance > data/social-insurance.txt
echo 'social-insurance is done'
ruby scrape_title.rb notary-public > data/notary-public.txt
echo 'notary-public is done'
