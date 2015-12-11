require_relative '../../lib/hash'

describe Carhop::Hash do
  it 'creates a SHA 1 of a file' do
    path = 'spec/fixtures/one.txt'
    sha256 = 'edd1eae3d9703439752a14e742afd563739988fe057ff10843cc61542065e3b1'
    expect(described_class.sha256 path).to eq sha256
  end
end
