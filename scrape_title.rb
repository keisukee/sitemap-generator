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

def retry_on_error(times: 3)
  try = 0
  begin
    try += 1
    yield
  rescue
    retry if try < times
    raise
  end
end

urls_to_scrape = []
title_list = []
urls.each do |url|
  if url.include?(scrape_name)
    urls_to_scrape << url
  end
end

times = 2
opt = {}
charset = nil
opt['User-Agent'] = 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/xxxxxx (KHTML, like Gecko) Chrome/xxxxxx Safari/xxxxx'

urls_to_scrape.each do |url|
  try = 0
  begin
    try += 1
    logger.info("scraping #{url}")
    html = open(url, opt) do |f|
      charset = f.charset
      f.read
    end
    doc = Nokogiri::HTML.parse(html, nil, charset)
    puts url
    puts doc.title
    sleep 2
  rescue
    logger.info("something wrong with #{url} and now retrying...")
    retry if try < times
    next
  end
end
