class Journey < ActiveRecord::Base

  START_LOCATION = "51.51981%2C-0.093918626"

  has_many :visits

  def calculate_arrival_times
    visits.sort_by(&:id).each_with_index do |visit, index|
      index == 0 ? first_arrival(visit) : following_arrival(visit, visits[index -1])
    end
  end

  private

  def first_arrival(visit)
    visit.arrival_time = start_time + travel_minutes(visit, START_LOCATION, start_time)*60
  end

  def following_arrival(visit, previous_visit)
    start_location = "#{previous_visit.latitude}%2C#{previous_visit.longitude}"
    visit.arrival_time = previous_visit.arrival_time + travel_minutes(visit, start_location, previous_visit.arrival_time)*60
  end

  def travel_minutes(visit, start_location, time)
    request = "https://developer.citymapper.com/api/1/traveltime/?startcoord=#{start_location}&endcoord=#{visit.latitude}%2C#{visit.longitude}&time=#{time}&time_type=departure&key=#{CITY_MAPPER_KEY}"
    city_mapper_call(request)
  end

  def city_mapper_call(request)
    response = HTTParty.get(request)
    response["travel_time_minutes"]
  end

end
