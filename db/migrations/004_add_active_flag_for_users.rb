Sequel.migration do
  change do
    add_column :users, :active, TrueClass, default: true
  end
end
