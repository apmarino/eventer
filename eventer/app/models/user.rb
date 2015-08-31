class User < ActiveRecord::Base
   has_and_belongs_to_many :events
   has_secure_password 
   validates :password_confirmation, presence: true

   has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, 
      default_url: "/images/:style/missing.png",
      path: "eventer/public/attachments/:class/:id_:basename.:extension"
   validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

end
