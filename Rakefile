namespace :db do
  desc "Run migrations"
  task :migrate, [:version] do |t, args|
    require 'sequel'
    Sequel.extension :migration
    db = Sequel.connect('mysql2://' + ENV.fetch('MYSQLCS_CONNECT_STRING'),
                        :user => ENV.fetch('MYSQLCS_USER_NAME'),
                        :password => ENV.fetch('MYSQLCS_USER_PASSWORD')
                       )
    if args [:version]
      puts "Migrating to version #{args[:version]}"
      Sequel::Migrator.run(db, 'db/migrations', target: args[:version].to_i)
    else
      puts 'Migrating to latest'
      Sequel::Migrator.run(db, 'db/migrations')
    end
  end
end
