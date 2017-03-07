require './lib/link'

describe Link do
  subject(:link){described_class.new('https://inbox.google.com/u/0/?pli=1')}
xit "takes you to a web site" do
    expect(link.url).to eq('https://inbox.google.com/u/0/?pli=1')
  end

end
