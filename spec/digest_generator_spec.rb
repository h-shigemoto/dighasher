require 'spec_helper'

# DigestGenerator spec
describe DigestGenerator do

  it 'generate md5 digest instance' do
    digest = DigestGenerator.generate_digest(DigestGenerator::MD5, "md5")
    expect(digest).to be_truthy
  end

  it 'generate sha1 digest instance' do
    digest = DigestGenerator.generate_digest(DigestGenerator::SHA1, "sha1")
    expect(digest).to be_truthy
  end

  it 'generate sha256 digest instance' do
    digest = DigestGenerator.generate_digest(DigestGenerator::SHA256, "sha256")
    expect(digest).to be_truthy
  end

  it 'generate sha512 digest instance' do
    digest = DigestGenerator.generate_digest(DigestGenerator::SHA512, "sha512")
    expect(digest).to be_truthy
  end

  it 'generate sha2 digest instance' do
    digest = DigestGenerator.generate_digest(DigestGenerator::SHA2, "sha2")
    expect(digest).to be_truthy
  end

  it 'generate str nil digest instance' do
    digest = DigestGenerator.generate_digest(DigestGenerator::MD5)
    expect(digest).to be_truthy
  end

  it 'generate nil' do
    digest = DigestGenerator.generate_digest(10000, "nil digest")
    expect(digest).to be_falsey
  end
end