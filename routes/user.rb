before '/users*' do
  content_type 'application/json'
end

after '/users*' do
  response.body = JSON.dump(response.body)
end

def active_users
  User.select(:id, :first_name, :last_name, :email_address).where(active: true)
end

get '/users' do
  active_users.all
end

get '/users/:id' do |id|
  active_users[:id => id] || halt(404, { message: 'User not found'})
end

post '/users' do
  User.from_json(request.body.read).save
end

put '/users/:id' do |id|
  (user = active_users[:id => id]) || halt(404, { message: 'User not found'})
  if user
    user.from_json(request.body.read).save
  end
end

delete '/users/:id' do |id|
  if (user = active_users[:id => id])
    user.update(active: false)
  end
end
