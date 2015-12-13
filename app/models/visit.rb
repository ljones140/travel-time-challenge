class Visit < ActiveRecord::Base

  belongs_to :journey

  geocoded_by :postcode
  after_validation :geocode

end
