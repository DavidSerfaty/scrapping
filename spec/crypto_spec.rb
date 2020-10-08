require_relative '../lib/crypto'

describe "Crypto Scrap should return a global array" do
  it "test the global resul" do
    expect(final_result).to be_kind_of(Array)
  end
  it "should return a hash with the name of crypto and the value" do
    expect(final_result).not_to be_nil
  end
end

describe "Crypto Scrap should scrap data from a website" do
  it "should return a value BTC.. else the program don't work. Long life for BTC" do
    expect(crypto_name).to include("BTC")
  end
end
