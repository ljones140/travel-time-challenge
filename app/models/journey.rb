class Journey < ActiveRecord::Base

  START_LOCATION = "51.51981%2C-0.093918626"

  has_many :visits

  def calculate_arrival_times
    visits.each_with_index do |visit, index|
      if index == 0
        visit.arrival_time = start_time + travel_minutes(visit, START_LOCATION, start_time)*60
        visit.save
      else
        start_location = "#{visits[index -1].latitude}%2C#{visits[index -1].longitude}"
        visit.arrival_time = visits[index -1].arrival_time + travel_minutes(visit, start_location, visits[index -1].arrival_time)*60
      end
    end
  end

  private

  def travel_minutes(visit, start_location, time)
    request = "https://developer.citymapper.com/api/1/traveltime/?startcoord=#{start_location}&endcoord=#{visit.latitude}%2C#{visit.longitude}&time=#{time}&time_type=departure&key=#{CITY_MAPPER_KEY}"
    city_mapper_call(request)
  end

  def city_mapper_call(request)
    response = HTTParty.get(request)
    response["travel_time_minutes"]
  end

end
