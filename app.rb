$:.unshift File.expand_path("./../lib/app", __FILE__)
require 'scrapper'
require 'spreadsheet'
require 'open-uri'
require 'json' 
require 'bundler'
Bundler.require

scrap = Scrapper.new
scrap.parser
scrap.save_as_json
