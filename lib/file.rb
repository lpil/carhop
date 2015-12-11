require_relative 'carhop'

class Carhop::File
  attr_reader :path

  def initialize(path:)
    @path = path
  end

  def hash
    # Is there a way to stream this into the SHA function
    # rather than loading the entire file into memory?
    @_hash ||= Digest::SHA256.hexdigest File.read(path)
  end

  def clean_name
    @clean_name ||= File.basename(path)
                    .downcase
                    .gsub(/[^a-z_.]/, '-')
                    .gsub(/-+/, '-')
  end

  def s3_name
    "#{hash}-#{clean_name}"
  end
end
