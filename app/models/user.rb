require 'digest'

class User < ApplicationRecord
  validates :login, presence: true, uniqueness: true
  validates :password, confirmation: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  before_save :generate_salt
  before_save :encrypt_password

  private
  def generate_salt
    chars = '0123456789abcdefghijklmnopqrstuvwxyz`~!#$%^&*()_+-=[]{}\|;:,./<>?'
    self.salt = ''
    random = Random.new
    32.times do
      self.salt << chars[random.rand(chars.size)]
    end
  end

  def encrypt_password
    self.password = Digest::SHA2.new(256).hexdigest("OneConfig_#{self.password}_#{self.salt}")
  end
end
