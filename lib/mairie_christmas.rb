require 'rubygems'
require 'nokogiri'
require 'open-uri'

def get_townhall_urls
  townhall_urls = Nokogiri::HTML(URI.open("http://annuaire-des-mairies.com/val-d-oise.html"))
  return townhall_urls.xpath('//a[@class="lientxt"]/@href')
end

def get_townhall_info_url(townhall_url)
  return Nokogiri::HTML(URI.open("http://annuaire-des-mairies.com/"+townhall_url))
end

def get_townhall_email(townhall_url)
  return get_townhall_info_url(townhall_url).xpath("/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]").text
end

def get_townhall_name(townhall_url)
  return get_townhall_info_url(townhall_url).xpath("/html/body/div/main/section[1]/div/div/div/h1").text.split(' ').delete_at(0).downcase
end

def get_townhall_info
  townhall_array = Array.new

  get_townhall_urls.each do |town|
    townhall_hash = Hash.new
    townhall_hash[get_townhall_name(town)] = get_townhall_email(town)
    townhall_array << townhall_hash
    puts townhall_hash
  end
   return townhall_array
end

get_townhall_info
