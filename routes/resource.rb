before '/resources*' do
  content_type 'application/json'
end

after '/resources*' do
  response.body = JSON.dump(response.body)
end

def active_resources
  Resource.select(:id, :first_name, :last_name, :email_address).where(active: true)
end

get '/resources' do
  active_resources.all
end

get '/resources/:id' do |id|
  active_resources[:id => id] || halt(404, { message: 'Resource not found'})
end

post '/resources' do
  Resource.from_json(request.body.read).save
end

delete '/resources/:id' do |id|
  if (resource = active_resources[:id => id])
    resource.update(active: false)
  end
end
