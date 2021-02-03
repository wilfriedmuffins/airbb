#email:string

#password stringvirtual
#password_confirmation:string virtual
class User < ApplicationRecord
    has_secure_password
end
