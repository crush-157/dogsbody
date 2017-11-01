require 'sinatra'
require 'sequel'

require './error.rb'
require './db/driver.rb'

if defined? DB
  require './models/user'
  require './models/resource'
  require './models/ticket'

  require './routes/user'
  require './routes/resource'
  require './routes/ticket'
else
  require './routes/no_db'
end
