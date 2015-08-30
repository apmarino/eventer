class User < ActiveRecord::Base
   has_and_belongs_to_many :events
   has_secure_password 
   validates :password_confirmation, presence: true
end
