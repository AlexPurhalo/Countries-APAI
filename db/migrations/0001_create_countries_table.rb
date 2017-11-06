Sequel.migration do
  up do
    create_table :countries do
      primary_key :id

      String :name, null: false
      String :code, null: false
    end
  end

  down do; drop_table :countries; end
end