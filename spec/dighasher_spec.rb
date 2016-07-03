require 'spec_helper'

# Dighasher::Generator spec.
describe Dighasher do

  it 'has a version number' do
    expect(Dighasher::VERSION).not_to be nil
  end

  it 'available test' do
    available = Dighasher.available
    expect(available).to eq "Digest::MD5, Digest::SHA1, Digest::SHA256, Digest::SHA512, Digest::SHA2(256, 384, 512)"
  end
end
