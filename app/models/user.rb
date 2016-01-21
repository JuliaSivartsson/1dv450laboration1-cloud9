require 'bcrypt'

class User < ActiveRecord::Base
    include BCrypt
    attr_accessor :password
    
    before_save :encrypt_password
    after_save :clear_password
    
    validates :name, presence: true, uniqueness: true, length: { in: 3..20 }
    validates :password, confirmation: true
    validates_length_of :password, in: 6..30, on: :create
    
    def encrypt_password
    unless password.blank?
      self.salt = BCrypt::Engine.generate_salt
      self.encrypted_password = BCrypt::Engine.hash_secret(password, salt)
    end
  end

  def clear_password
    self.password = nil
  end
end