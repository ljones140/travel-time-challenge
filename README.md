# Travel Time Challenge

## Install


```sh
bundle install
$git clone https://github.com/ljones140/travel-time-challenge
$cd travel-time-challenge
$bundle install
$bin/rake db:create
$bin/rake db:migrate
bin/rails s
```

### Set up City Mapper API Key
The application makes a call to City Mappers API to calculate the travel time between visits. The HTTParty gem has been used for the get request to the API. An environmental ENV["CITY_MAPPER_KEY"] is referenced in config/initializers/api.rb. To use the application save your own citymapper key as the env variable.

## Geocoding
To convert post codes into latitude and longitude the geocoder gem has been
used. This created the lat and lon on the model after it is validated.

## Testing
Test have been written in RSpec using Cabybara for the feature tests. Factory
Girl gem has been used to test the database calls.
