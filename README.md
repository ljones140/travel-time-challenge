# Travel Time Challenge

## Geocoding
To convert post codes into latitude and longitude the geocoder gem has been
used. This created the lat and lon on the model after it is validated.

## City Mapper API
The application makes a call to City Mappers API to calculate the travel time between visits. The HTTParty gem has been used for the get request to the API. An environmental ENV["CITY_MAPPER_KEY"] is referenced in config/initializers/api.rb. To use the application save your own citymapper key as the env variable.


