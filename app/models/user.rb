class User < ApplicationRecord
     before_save {
          self.email = email.downcase if email.present?
     }

     before_save :format_user_name

     validates :name, length: {minimum: 1, maximum: 100 }, presence: true

     validates :password, presence: true, length: {minimum: 6}, if: -> { password_digest.nil? }
     validates :password, length: {minimum: 6}, allow_blank: true

     validates :email, presence: true, uniqueness: {case_sensitive: false}, length: {minimum: 3, maximum: 254}

     has_secure_password

     def format_user_name
          if name
               uppercase_name = []
               partial_names = name.split
               partial_names.each do |partial_name|
                    uppercase_name << partial_name.capitalize
               end
               self.name = uppercase_name.join(" ")
          end
     end
end
