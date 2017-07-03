require 'openssl'
require "base64"

module EncryptHelper

  ALGORITHM = "aes-128-cbc"

  def self.encode(data)
    key, iv = fetch_key_iv
    cipher = OpenSSL::Cipher.new(ALGORITHM)
    cipher.encrypt
    cipher.key = [key].pack("H*")
    cipher.iv  = [iv].pack("H*")
    data = cipher.update(data) + cipher.final
    Base64.encode64(data)
  end

  def self.decode(data)
    data = Base64.decode64(data)
    key, iv = fetch_key_iv
    cipher = OpenSSL::Cipher.new(ALGORITHM)
    cipher.decrypt
    cipher.key = [key].pack("H*")
    cipher.iv  = [iv].pack("H*")
    data = cipher.update(data) + cipher.final
    return data
  end

  def self.fetch_key_iv
    path = "#{Rails.root}/config/secrets.yml"
    data = YAML.load_file(path)[Rails.env]
    key = data['encrypt_key'].to_s
    iv = data['encrypt_iv'].to_s
    [key, iv]
  end
end
