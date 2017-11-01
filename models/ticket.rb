class Ticket < Sequel::Model
  plugin :json_serializer
  plugin :timestamps, create: :created, update: :last_updated
  set_primary_key :id
  many_to_one :user
  many_to_one :resource
end
