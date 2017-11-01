Sequel.migration do
  change do
    create_table :tickets do
      primary_key :id
      foreign_key :user_id, :users, :null => false
      foreign_key :resource_id, :resources
      String :details, :text => true, :null => false
      DateTime :created, :null => false
      DateTime :last_updated
    end
  end
end
