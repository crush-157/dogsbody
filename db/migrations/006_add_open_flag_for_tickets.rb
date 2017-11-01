Sequel.migration do
  change do
    add_column :tickets, :open, TrueClass, default: true
  end
end
