require_relative '../../lib/file'

describe Carhop::File do
  let(:path)     { 'spec/fixtures/one.txt' }
  let(:instance) { described_class.new path: path }
  let(:sha256) do
    'edd1eae3d9703439752a14e742afd563739988fe057ff10843cc61542065e3b1'
  end

  it { expect(instance.path).to eq path }

  it 'can report its sha256' do
    expect(instance.hash).to eq sha256
  end


  describe '#clean_name' do
    it 'gets the base name from the path' do
      file = described_class.new path: 'foo/bar.md'
      expect(file.clean_name).to eq 'bar.md'
    end

    it 'strips all those horrible non internetty chars' do
      file = described_class.new path: 'my stuff/what!"£^&*()?_-][#the.tar.gz'
      expect(file.clean_name).to eq 'what-_-the.tar.gz'
    end

    it 'is always lowercase' do
      file = described_class.new path: 'FOO.PNG'
      expect(file.clean_name).to eq 'foo.png'
    end
  end


  describe '#s3_name' do
    it 'is the hash + the clean name!' do
      expect(instance.s3_name).to eq "#{sha256}-one.txt"
    end
  end
end
