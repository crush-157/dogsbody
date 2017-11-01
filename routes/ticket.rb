before '/tickets*' do
  content_type 'application/json'
end

after '/tickets*' do
  response.body = JSON.dump(response.body)
end

get '/tickets' do
  dataset = Ticket
  [:user_id, :resource_id, :open].each do |filter|
    dataset = dataset.where(filter => params[filter]) if params[filter]
  end
  dataset.all
end

get '/tickets/:id' do |id|
  ticket = Ticket[:id => id]
  halt(404, { message: 'Ticket not found'}) unless ticket
  ticket
end

post '/tickets' do
  Ticket.from_json(request.body.read).save
end

patch '/tickets/:id' do |id|
  ticket = Ticket[:id => id]
  halt(404, { message: 'Ticket not found'}) unless ticket
  ticket.from_json(request.body.read).save
end

put '/tickets/:id' do |id|
  ticket = Ticket[:id => id]
  halt(404, { message: 'Ticket not found'}) unless ticket
  ticket.from_json(request.body.read).save
end
