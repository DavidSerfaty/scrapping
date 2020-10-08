require 'rubygems'
require 'nokogiri'
require 'open-uri'

def coinmarketcap_data
  return coinmarketcap = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))
end

def crypto_name
  xpath_crypto_name = coinmarketcap_data.xpath('//td[contains(@class,"symbol")]')
  crypto_name_array = Array.new
  xpath_crypto_name.each do |name|
    crypto_name_array << name.text
  end
  return crypto_name_array
end

def crypto_price
  xpath_crypto_price = coinmarketcap_data.xpath('//td[contains(@class,"price")]')
  crypto_price_array = Array.new
  xpath_crypto_price.each do |price|
    crypto_price_array << price.text.delete('$,').to_f
  end
  return crypto_price_array
end

def final_result
  result = Array.new
  crypto_name.zip(crypto_price).each do |crypto_name, crypto_price|
    crypto_hash = Hash.new
    crypto_hash[crypto_name] = crypto_price
    puts crypto_hash
    result << crypto_hash
  end
  return result
end

final_result
