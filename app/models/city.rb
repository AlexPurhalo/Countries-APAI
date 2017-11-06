class City < Sequel::Model
  many_to_one :country
end