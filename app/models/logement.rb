class Logement < ApplicationRecord
    mount_uploaders :images, ImageUploader
    serialize :images
    serialize :equipments

    geocoded_by :adresse
    
    after_validation :geocode, if: :adresse_changed?

    belongs_to :user
    has_many :bookings, dependent: :destroy
    has_many :comments, dependent: :destroy

    validates :adresse, presence: true
    validates :start_date_of_availability, presence: true
    validates :end_date_of_availability, presence: true
    validates :voyageur, presence: true
    validates :city, presence: true

    ICONS = %i[cuisine couverts refrigirateur mini_refrigirateur four micro_onde lave_vaisselle congelateur lave_linge seche_linge baignoire savon_pour_le_corps shampooing fer seche_cheveux armoire cintre draps oreillers_couettes wifi work tv animaux clim fumeur no_smock]

    after_create :reset_counter_cache

    private 

    def reset_counter_cache
        logement = Logement.last
        Logement.reset_counters(logement.id, :bookings_count)
        Logement.reset_counters(logement.id, :comments_count)
    end

    #
end 
