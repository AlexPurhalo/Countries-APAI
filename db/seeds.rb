require_relative 'cities'
require_relative 'countries'

countries = Countries.new.data
countries.map { |country| Country.create(name: country[:name], code: country[:code].upcase)}
cities = Cities.new.data
puts cities.count
sleep 4
cities_records = cities.map do |city|
  puts city
  params = {
      name:       city[:name],
      country_id: Country.where(code: city[:country]).first ? Country.where(code: city[:country]).first.id : nil,
      lon_coord:  city[:coord][:lon],
      lat_coord:  city[:coord][:lat]
  }

  City.create(params)
end

puts cities_records