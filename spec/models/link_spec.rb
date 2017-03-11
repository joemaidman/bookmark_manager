require './app/models/link'

describe Link do

  subject(:link){described_class.new(url: 'http://www.bbc.co.uk', title: 'BBC News')}
  
  it "Creates a link" do
    expect(link.url).to eq('http://www.bbc.co.uk')
    expect(link.title).to eq('BBC News')
  end

end
