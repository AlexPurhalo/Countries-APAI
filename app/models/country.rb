class Country < Sequel::Model
  one_to_many :cities
end