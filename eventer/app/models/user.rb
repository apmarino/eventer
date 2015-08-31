class User < ActiveRecord::Base
   has_and_belongs_to_many :events
   has_secure_password 

   validates :password_confirmation, presence: true

   has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" },
      default_url: "/images/:style/missing.png"
      validates_attachment :avatar, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

end





