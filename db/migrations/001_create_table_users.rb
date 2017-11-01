Sequel.migration do
  change do
    create_table :users do
      primary_key :id
      String :first_name, :length => 256, :null => false
      String :last_name, :length => 256, :null => false
      String :email_address, :length => 512, :null => false
      index :email_address, unique: true
    end
  end
end
