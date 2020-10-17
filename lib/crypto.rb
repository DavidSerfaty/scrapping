require 'rubygems'
require 'nokogiri'
require 'open-uri'

def coinmarketcap_data
  return Nokogiri::HTML(URI.open('https://coinmarketcap.com/all/views/all/'))
end

def crypto_name
  return coinmarketcap_data.xpath('//td[contains(@class,"symbol")]')
end

def crypto_price
  return coinmarketcap_data.xpath('//td[contains(@class,"price")]')
end

def final_result
  result = []
  crypto_name.zip(crypto_price).each do |crypto_name, crypto_price|
    crypto_hash = {}
    crypto_hash[crypto_name.text] = crypto_price.text.delete('$,').to_f
    puts crypto_hash
    result << crypto_hash
  end
  return result
end

final_result
