class User < ActiveRecord::Base
    attr_accessor :password
    validates :name, presence: true, uniqueness: true, length: { in: 3..20 }
    validates :password, confirmation: true
    validates_length_of :password, in: 6..30, on: :create
end