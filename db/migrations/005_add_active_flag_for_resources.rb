Sequel.migration do
  change do
    add_column :resources, :active, TrueClass, default: true
  end
end
