require_relative 'carhop'

class Carhop::File
  attr_reader :path

  def initialize(path)
    @path = path
  end

  def hash(path)
    # Is there a way to stream this rather than loading the
    # entire file into memory?
    @_hash ||= Digest::SHA256.hexdigest File.read(path)
  end
end
