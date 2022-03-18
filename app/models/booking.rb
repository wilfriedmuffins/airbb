class Booking < ApplicationRecord
  belongs_to :logement, counter_cache: true
  belongs_to :user

  validates :voyageur, presence: true

  validates :end_booking, presence: true
  validates :start_booking, presence: true
  validate :check_start_booking, :check_end_booking, :check_voyageur, :check_price_create

  before_update :check_start_booking, :check_end_booking, :check_voyageur, :check_price_update
  
  def check_start_booking
    @logement = Logement.find(logement_id)
    puts start_booking
    if @logement.start_date_of_availability >= start_booking
      errors.add(:start_booking, "logement non disponible à la date de début")
    end
  end

  def check_end_booking
    @logement = Logement.find(logement_id) 
    puts end_booking
    if @logement.end_date_of_availability <= end_booking
      errors.add(:end_booking, "logement non disponible à la date de fin")
    end
  end

  def check_voyageur
    @logement = Logement.find(logement_id)
    puts voyageur
    if @logement.voyageur < voyageur
      errors.add(:voyageur, "nombre de voyageur indisponible pour ce logement")
    end
  end

  def check_price_update
    @booking = Booking.find(id)
    puts @booking.inspect

    @logement = Logement.find(@booking.logement_id)
    puts @logement.price
    
    puts (((@booking.end_booking-@booking.start_booking).to_i)*@logement.price)
    self.t_price = ((@booking.end_booking-@booking.start_booking).to_i)*@logement.price
  end

  def check_price_create
    @logement = Logement.find(logement_id)
    puts @logement.price
    
    puts (((end_booking-start_booking).to_i)*@logement.price)
    self.t_price = (((end_booking-start_booking).to_i)*@logement.price)
  end

end
