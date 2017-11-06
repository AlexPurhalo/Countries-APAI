Sequel.migration do
  up do
    create_table :cities do
      primary_key :id
      foreign_key :country_id

      String :name,       null: false
      Float  :lat_coord,  null: false
      Float  :lon_coord,  null: false
    end
  end
end