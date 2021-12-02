class Logement < ApplicationRecord
    mount_uploaders :images, ImageUploader
    serialize :images
    geocoded_by :address

    before_save {self.city.downcase!}
    after_validation :geocode, if: :address_changed?

    def address
        [adresse, city, zipcode].compact.join(", ")
    end

    def address_changed?
        adresse_changed? | city_changed? | zipcode_changed?
    end

    belongs_to :user
    has_many :bookings
    has_many :comments

    validates :adresse, presence: true
    validates :start_date_of_availability, presence: true
    validates :end_date_of_availability, presence: true
    validates :voyageur, presence: true
    validates :city, presence: true
    validates :zipcode, presence: true
end
