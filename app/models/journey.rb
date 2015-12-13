class Journey < ActiveRecord::Base

  START_LAT = 51.519812
  START_LON = -0.093918626

  has_many :visits

  def arrival_time
    visit = visits.first
    city_mapper_call(visit)
  end

  private

  def city_mapper_call(visit)
    response = HTTParty.get("https://developer.citymapper.com/api/1/traveltime/?startcoord=#{START_LAT}%2C#{START_LON}&endcoord=#{visit.latitude}%2C#{visit.longitude}&time=2015-12-13T19%3A00%3A02-0500&time_type=departure&key=#{CITY_MAPPER_KEY}")
    response["travel_time_minutes"]
  end

end
