require "dighasher/digest_generator"

# Hash Generate Module
module Dighasher

  # Hash Generate Class
  class Generator

    # constructor
    # @param [integer] mode Hash mode. DigestGenerator::Xxxx constant.
    # @param [String] str target string
    # @param [integer] bitlen SHA2 bitlength. 256 or 384 or 512.
    def initialize(mode, str=nil, bitlen=256)

      # generate digest instance
      @digest = Dighasher::DigestGenerator::generate_digest(mode, str, bitlen)
      @mode = mode
      @bitlen = bitlen
      @base_str = str
    end

    # change hash mode.
    # @param [integer] mode Hash mode. DigestGenerator::Xxxx constant.
    # @param [integer] bitlen SHA2 bitlength. 256 or 384 or 512.
    def change_mode(mode, bitlen=256)

      # generate new digest instance
      @digest = Dighasher::DigestGenerator::generate_digest(mode, @base_str, bitlen)
      @mode = mode
      @bitlen = bitlen
    end

    # update hash target string.
    # @param [String] str update string
    def update(str)

      # unless str, no update.
      return unless str

      # update str.
      @digest.update(str)

      # if @base_str equals nil, @base_str set empty.
      @base_str = '' unless @base_str
      @base_str << str
    end

    # reset digest instance.
    def reset

      # reset @digest
      @digest.reset
      @base_str = nil
    end

    # compare str and hash str.
    # @param [String] str compare target string
    # @param [String] temp_add_str temporary additional string.
    # @return [boolean] true:equal hash / false:not equal hash
    def equals(str, temp_add_str=nil)

      # if exist temporary add string, dup @digest and add str.
      eq_digest = get_temporary_digest(temp_add_str)
      # generate compare digest instance.
      comp_digest = Dighasher::DigestGenerator.generate_digest(@mode, str, @bitlen)

      # compare hex digest value.
      return eq_digest == comp_digest.hexdigest
    end

    # generate hash.
    # @param [boolean] use_hex_string if true, use hexdigest. else, use digest.
    # @param [String] temp_add_str temporary additional string.
    # @return [Byte / String] hash
    def generate_hash(use_hex_string=true, temp_add_str=nil)

      # if exist temp_add_str, dup @digest and add str.
      hash_digest = get_temporary_digest(temp_add_str)
      hash =  use_hex_string ? hash_digest.hexdigest : hash_digest.digest
      hash
    end

    # generate hash.
    # reset after generate hash.
    # @param [boolean] use_hex_string if true, use hexdigest. else, use digest.
    # @return [Byte / String] hash.
    def generate_hash!(use_hex_string=true)

      # generate hash and @digest reset.
      hash = use_hex_string ? @digest.hexdigest! : @digest.digest!
      @base_str = nil
      hash
    end

    # generate file hash.
    # reset before generate hash.
    # @param [String] file_path target file path
    # return [String] hash
    def file_hash(file_path)

      @digest.reset
      @base_str = nil
      @digest.file(file_path).to_s
    end

    # get digest instance.
    # @return [Digest] digest lib instance.
    def digest
      @digest
    end

    # get digest mode.
    # @return [integer] digest mode. DigestGenerator constant.
    def mode
      @mode
    end

    # get byte length
    # @return [integer] bitlen. Use DigestGenerator::SHA2 mode only.
    def bitlen
      @bitlen
    end

    # get hash base string.
    # @return [String] hash base string.
    def base_str
      @base_str
    end

    private

    # get temporary digest(dup @digest) and add string.
    # @param [String] temp_add_str temporary additional string.
    # @return [String] temporary digest instance.
    def get_temporary_digest(temp_add_str)

      # if not exist temp_add_str, return @digest
      return @digest unless temp_add_str

      # dup @digest and add str.
      temp_digest = @digest.dup
      temp_digest.update(temp_add_str)
      temp_digest
    end
  end
end
