before '/users*' do
  content_type 'application/json'
end

after '/users*' do
  response.body = JSON.dump(response.body)
end

get '/*' do
  halt(500, { message: 'Database Unavailable.  Please inform System Administrator.' })
end
