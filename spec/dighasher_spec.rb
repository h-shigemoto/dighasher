require 'spec_helper'

describe Dighasher do
  it 'has a version number' do
    expect(Dighasher::VERSION).not_to be nil
  end

  it 'generate Generator instance' do
    generator = Dighasher::Generator.new(DigestGenerator::MD5, "md5")
    expect(generator).to be_truthy
  end

  it 'generate hash test' do
    generator = Dighasher::Generator.new(DigestGenerator::SHA1, "sha1")
    hash = generator.generate_hash
    # puts hash
    expect(hash).to be_truthy
  end

  it 'generate hash test temporary add str' do
    generator = Dighasher::Generator.new(DigestGenerator::SHA256, "sha256")
    hash = generator.generate_hash(false, "temporary")
    # puts hash
    expect(hash).to be_truthy
  end

  it 'generate hash! test use bytes' do
    generator = Dighasher::Generator.new(DigestGenerator::SHA2, "sha2")
    hash = generator.generate_hash!(false)
    # puts hash
    expect(hash).to be_truthy
    expect(generator.equals("sha2")).to be_falsey
    expect(generator.base_str).to be_falsey
  end

  it 'generate hash! test use hex string' do
    generator = Dighasher::Generator.new(DigestGenerator::SHA2, "sha2", 384)
    hash = generator.generate_hash!
    # puts hash
    expect(hash).to be_truthy
    expect(generator.equals("sha2")).to be_falsey
    expect(generator.base_str).to be_falsey
  end

  it 'hash str update test' do
    generator = Dighasher::Generator.new(DigestGenerator::SHA2, "sha2", 384)
    hash = generator.generate_hash
    generator.update("update")
    update_hash = generator.generate_hash
    expect(hash).not_to eq update_hash
  end

  it 'temporary add test by generate hash' do
    generator = Dighasher::Generator.new(DigestGenerator::SHA1, "sha1")
    temporary_hash = generator.generate_hash(false, "temporary")
    hsah = generator.generate_hash(false)
    expect(temporary_hash).not_to eq hash
  end

  it 'reset test' do
    generator = Dighasher::Generator.new(DigestGenerator::MD5, "md5")
    generator.reset
    expect(generator.equals("md5")).to be_falsey
  end

  it 'reset test base str' do
    generator = Dighasher::Generator.new(DigestGenerator::SHA2, "sha2")
    generator.reset
    expect(generator.base_str).to be_falsey
  end

  it 'equals test hash' do
    generator = Dighasher::Generator.new(DigestGenerator::SHA512, "sha512")
    expect(generator.equals("sha512")).to be_truthy
  end

  it 'equals test temporary add str' do
    generator = Dighasher::Generator.new(DigestGenerator::SHA512, "sha512")
    expect(generator.equals("sha512temporary", "temporary")).to be_truthy
  end

  it 'temporary add test by equals' do
    generator = Dighasher::Generator.new(DigestGenerator::MD5, "md5")
    expect(generator.equals("md5temporary", "temporary")).to be_truthy
    expect(generator.equals("md5")).to be_truthy
  end

  it 'file hash test' do
    generator = Dighasher::Generator.new(DigestGenerator::SHA512, "sha512")
    hash = generator.file_hash(__FILE__)
    # puts hash
    expect(hash).to be_truthy
  end

  it 'file hash reset test' do
    generator = Dighasher::Generator.new(DigestGenerator::SHA256, "sha256")
    hash = generator.file_hash(__FILE__)
    # puts hash
    expect(hash).to be_truthy
    expect(generator.equals("sha256")).to be_falsey
  end

  it 'file hash reset test base str' do
    generator = Dighasher::Generator.new(DigestGenerator::SHA1, "sha1")
    expect(generator.base_str).to eq "sha1"
    hash = generator.file_hash(__FILE__)
    # puts hash
    expect(hash).to be_truthy
    expect(generator.base_str).to be_falsey
  end

  it 'base str test' do
    generator = Dighasher::Generator.new(DigestGenerator::SHA1)
    generator.update("Ruby")
    generator.update("Gem")
    expect(generator.base_str).to eq "RubyGem"
  end

  it 'base str test nil' do
    generator = Dighasher::Generator.new(DigestGenerator::MD5)
    generator.update(nil)
    expect(generator.base_str).to be_falsey
  end
end