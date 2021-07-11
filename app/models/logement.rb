class Logement < ApplicationRecord

    geocoded_by :address
    after_validation :geocode, if: :address_changed?

    def address
        [adresse, city, zipcode].compact.join(", ")
    end

    def address_changed?
        adresse_changed? | city_changed? | zipcode_changed?
    end

end
