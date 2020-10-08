# frozen_string_literal: true

require_relative '../lib/cher_depute'

describe 'get_townhall_urls method,  return the xml selection' do
  it 'TEST return type' do
    expect(get_deputy_list_url).to be_kind_of(Nokogiri::XML::NodeSet)
  end
end

describe 'get_townhall_email and name method, it takes an url and gives the good data' do
  it 'test email method' do
    expect(get_deputy_email('/deputes/fiche/OMC_PA605036')).to eq('damien.abad@assemblee-nationale.fr')
  end
  it 'test first name method' do
    expect(get_deputy_first_name('/deputes/fiche/OMC_PA605036')).to eq('Damien')
  end
  it 'test name method' do
    expect(get_deputy_name('/deputes/fiche/OMC_PA605036')).to eq('Abad')
  end
end

describe 'get_townhall_email and name method, it takes an url and gives the good data' do
  it 'test the global resul' do
    expect(all_deputy_infos).to be_kind_of(Array)
  end
end
