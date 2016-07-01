require 'spec_helper'

# Dighasher::DigestGenerator spec
describe Dighasher do

  it 'generate md5 digest instance' do
    digest = Dighasher::DigestGenerator.generate_digest(Dighasher::DigestGenerator::MD5, "md5")
    expect(digest).to be_truthy
  end

  it 'generate sha1 digest instance' do
    digest = Dighasher::DigestGenerator.generate_digest(Dighasher::DigestGenerator::SHA1, "sha1")
    expect(digest).to be_truthy
  end

  it 'generate sha256 digest instance' do
    digest = Dighasher::DigestGenerator.generate_digest(Dighasher::DigestGenerator::SHA256, "sha256")
    expect(digest).to be_truthy
  end

  it 'generate sha512 digest instance' do
    digest = Dighasher::DigestGenerator.generate_digest(Dighasher::DigestGenerator::SHA512, "sha512")
    expect(digest).to be_truthy
  end

  it 'generate sha2 digest instance' do
    digest = Dighasher::DigestGenerator.generate_digest(Dighasher::DigestGenerator::SHA2, "sha2")
    expect(digest).to be_truthy
  end

  it 'generate str nil digest instance' do
    digest = Dighasher::DigestGenerator.generate_digest(Dighasher::DigestGenerator::MD5)
    expect(digest).to be_truthy
  end

  it 'generate nil' do
    digest = Dighasher::DigestGenerator.generate_digest(10000, "nil digest")
    expect(digest).to be_falsey
  end

  it 'available test' do
    available = Dighasher::DigestGenerator.available
    expect(available).to eq "Digest::MD5, Digest::SHA1, Digest::SHA256, Digest::SHA512, Digest::SHA2(256, 384, 512)"
  end
end
