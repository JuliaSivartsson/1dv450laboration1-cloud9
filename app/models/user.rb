require 'bcrypt'

class User < ActiveRecord::Base
  
    #Hash password in database
    has_secure_password
    validates :name, presence: true, uniqueness: true, length: { in: 3..20 }
    validates :password, confirmation: true
    validates_presence_of :password, :on => :create
    validates :password_confirmation, presence: true
    validates_length_of :password, in: 6..30, on: :create
end