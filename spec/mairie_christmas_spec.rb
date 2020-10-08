require_relative '../lib/mairie_christmas'

describe "get_townhall_urls method,  return the xml selection" do
  it "TEST return type" do
    expect(get_townhall_urls()).to be_kind_of(Nokogiri::XML::NodeSet)
  end
end

describe "get_townhall_email and name method, it takes an url and gives the good data" do
  it "test email method" do
    expect(get_townhall_email("95/nerville-la-foret.html")).to eq("mairie-nerville95@wanadoo.fr")
  end
  it "test name method" do
    expect(get_townhall_name("95/nerville-la-foret.html")).to eq("nerville-la-foret")
  end
end

describe "get_townhall_email and name method, it takes an url and gives the good data" do
  it "test the global resul" do
    expect(get_townhall_info).to be_kind_of(Array)
  end
end
