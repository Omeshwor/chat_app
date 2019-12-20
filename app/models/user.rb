class User < ApplicationRecord
    has_secure_password
    validates :username, presence: true, uniqueness: {case_sensitive: false}, length: {minimum: 3, maximum: 12}
    validates :password, presence: true, length: {minimum: 6, maximum: 8}

end
