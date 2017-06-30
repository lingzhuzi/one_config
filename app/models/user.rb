require 'digest'

class User < ApplicationRecord
  validates :login, presence: true, uniqueness: true
  validates :password, confirmation: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  before_save :generate_salt
  before_save :encrypt_password

  def authenticate(password_text)
    self.password == encrypt_with_salt(password_text)
  end

  private
  def generate_salt
    chars = '0123456789abcdefghijklmnopqrstuvwxyz`~!#$%^&*()_+-=[]{}\|;:,./<>?'
    salt = ''
    random = Random.new
    32.times do
      salt << chars[random.rand(chars.size)]
    end
    self.salt = Digest::SHA2.new(256).hexdigest(salt)
  end

  def encrypt_password
    self.password = encrypt_with_salt(self.password)
  end

  def encrypt_with_salt(text)
    Digest::SHA2.new(256).hexdigest("OneConfig_#{text}_#{self.salt}")
  end

end
