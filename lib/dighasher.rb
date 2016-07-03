require "dighasher/version"
require "dighasher/generator"
require "dighasher/digest_generator"

# Hash Generate Module
module Dighasher

  # get available hash.
  def self.available
    Dighasher::DigestGenerator.available
  end
end
