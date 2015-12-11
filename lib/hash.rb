require_relative 'carhop'

module Carhop::Hash
  def self.sha256(path)
    # Is there a way to stream this rather than loading the
    # entire file into memory?
    bytes = File.read path
    Digest::SHA256.hexdigest bytes
  end
end
