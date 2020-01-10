require 'open-uri'
require 'nokogiri'
require "selenium-webdriver"
require "logger"

scrape_name = ARGV[0]
logger = Logger.new("log/#{scrape_name}.log")

urls = []
File.open("sitemap-parsed.txt", "r") do |f|
  f.each_line do |line|
    urls << line.gsub(/\n/, '')
  end
end

urls_to_scrape = []
title_list = []
urls.each do |url|
  if url.include?(scrape_name)
    urls_to_scrape << url
  end
end

urls_to_scrape.each do |url|
  options = Selenium::WebDriver::Firefox::Options.new
  options.add_argument('-headless')
  driver = Selenium::WebDriver.for :firefox, options: options
  driver.get url

  title = driver.title
  logger.info("scraping #{url}")
  puts url
  puts title
end



