require 'rubygems'
require 'nokogiri'
require 'open-uri'

def coinmarketcap_data
  return coinmarketcap = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
end

def crypto_name
  coinmarketcap = coinmarketcap_data
  xpath_crypto_name = coinmarketcap.xpath('//td[@class="cmc-table__cell cmc-table__cell--sortable cmc-table__cell--left cmc-table__cell--sort-by__symbol"]')
  crypto_name_array = Array.new

  xpath_crypto_name.each do |name|
    crypto_name_array << name.text
  end
  return crypto_name_array
end

def crypto_price
  coinmarketcap = coinmarketcap_data
  xpath_crypto_price = coinmarketcap.xpath('//td[@class="cmc-table__cell cmc-table__cell--sortable cmc-table__cell--right cmc-table__cell--sort-by__price"]')
  crypto_price_array = Array.new

  xpath_crypto_price.each do |price|
    crypto_price_array << price.text.delete('$,').to_f
  end
  return crypto_price_array
end

def final_result
  crypto_name_array = crypto_name
  crypto_price_array = crypto_price

  result = Hash[crypto_name_array.zip(crypto_price_array)].each_slice(1).map(&:to_h)
  print result
end

final_result
