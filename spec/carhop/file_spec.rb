require_relative '../../lib/file'

describe Carhop::File do
  let(:path)     { 'spec/fixtures/one.txt' }
  let(:instance) { described_class.new path }

  it { expect(instance.path).to eq path }

  it 'can report its sha256' do
    sha = 'edd1eae3d9703439752a14e742afd563739988fe057ff10843cc61542065e3b1'
    expect(instance.hash path).to eq sha
  end
end
