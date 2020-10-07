require 'rubygems'
require 'nokogiri'
require 'open-uri'


def get_townhall_email(townhall_url)
  town_url = Nokogiri::HTML(URI.open("http://annuaire-des-mairies.com/"+townhall_url))
  return town_url.xpath("/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]").text
end

def get_townhall_name(townhall_url)
  town_url = Nokogiri::HTML(URI.open("http://annuaire-des-mairies.com/"+townhall_url))
  return town_url.xpath("/html/body/div/main/section[1]/div/div/div/h1").text
end

def get_townhall_urls
  townhall_urls = Nokogiri::HTML(URI.open("http://annuaire-des-mairies.com/val-d-oise.html"))
  xpath_mairies_ville = townhall_urls.xpath('//a[@class="lientxt"]/@href')

  mairies_villes_array = Hash.new

  xpath_mairies_ville.each do |ville|
    mairies_villes_array[get_townhall_name(ville.text)] = get_townhall_email(ville.value)
  end

   puts mairies_villes_array.each_slice(1).map(&:to_h)
end

get_townhall_urls
