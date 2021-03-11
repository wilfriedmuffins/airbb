#email:string

#password stringvirtual
#password_confirmation:string virtual
class User < ApplicationRecord
    has_secure_password

    before_save {self.email.downcase!}

    validates :first_name, presence: true, 
                        uniqueness: { case_sensitive: false }, 
                        length: {minimum: 3, maximum: 25}

    validates :last_name, presence: true, 
                        uniqueness: { case_sensitive: false }, 
                        length: {minimum: 3, maximum: 25}

    VALID_EMAIL_REGEX = /.+\@.+\..+/i

    validates :email, presence: true, 
                    uniqueness: { case_sensitive: false }, 
                    format: { with: VALID_EMAIL_REGEX}     
end
