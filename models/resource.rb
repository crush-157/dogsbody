class Resource < Sequel::Model
  plugin :json_serializer
  set_primary_key :id
  one_to_many :requests
end
