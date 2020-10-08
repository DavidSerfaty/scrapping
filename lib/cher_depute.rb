require 'rubygems'
require 'nokogiri'
require 'open-uri'

def get_deputy_url(deputy_url)
  return Nokogiri::HTML(URI.open("http://www2.assemblee-nationale.fr"+deputy_url))
end

def get_deputy_list_url
  deputy_list_url = Nokogiri::HTML(URI.open("http://www2.assemblee-nationale.fr/deputes/liste/alphabetique"))
  return deputy_list_url.xpath('//*[@id="deputes-list"]/div/ul/li/a/@href')
end

def get_deputy_email(deputy_url)
  return get_deputy_url(deputy_url).xpath('//*[@id="haut-contenu-page"]/article/div[3]/div/dl/dd[4]/ul/li[2]/a').text
end

def get_deputy_first_name(deputy_url)
  return get_deputy_url(deputy_url).xpath('//*[@id="haut-contenu-page"]/article/div[2]/h1').text.split(' ').delete_at(1)
end

def get_deputy_name(deputy_url)
  return get_deputy_url(deputy_url).xpath('//*[@id="haut-contenu-page"]/article/div[2]/h1').text.split(' ').delete_at(2)
end

def all_deputy_infos
  deputies = Array.new

  get_deputy_list_url.first(10).each do |deputy_url|
    deputy = Hash.new
    deputy["first_name"] = get_deputy_first_name(deputy_url)
    deputy["last_name"] = get_deputy_name(deputy_url)
    deputy["email"] = get_deputy_email(deputy_url)
    deputies << deputy
    puts deputy
  end
  # puts deputies
end

all_deputy_infos
