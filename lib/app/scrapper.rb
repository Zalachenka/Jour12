require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'bundler'
Bundler.require
   
class Scrapper
def parser
  url_cities_95 = 'https://annuaire-des-mairies.com/val-d-oise.html'

  unparsed_page = open(url_cities_95)
  page = Nokogiri::HTML(unparsed_page)
  array_cities_names = page.xpath("//a[@class='lientxt']").map(&:text) # pour récupérer un tableau avec tous les noms de ville du 95
  array_of_cities_links = [] # tableau qui va servir pour recuperer les adresses exactes des fiches mairies où se trouvent les mails
  @array_of_cities_emails = [] # tableau dans lequel on va stocker l'email de chaque ville

  # pour transformer les espaces des villes en tiret du 6
  array_cities_names.each do |city|
    city.gsub!(/\s/, '-')
    array_of_cities_links << "https://www.annuaire-des-mairies.com/95/#{city}.html"
  end
  array_of_cities_links.each do |city_link|
    city_link.downcase!
    unparsed_city_page = open(city_link)

    city_page = Nokogiri::HTML(unparsed_city_page)
    email = city_page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text
    @array_of_cities_emails << email
    @array_of_cities_emails      # binding.pry
  end

  @arrays_of_cities_information = array_cities_names.zip(@array_of_cities_emails).map { |name, mail| { name => mail } }
  @arrays_of_cities_information.reject { |mairie, mail| mairie.nil? || mail.nil? }
 end

	def save_as_json
		File.open("db/emails.json","w") do |f|
  		f.write(@array_of_cities_emails.to_json)
		end

	end


end


