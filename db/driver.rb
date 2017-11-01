def execute_db_operation(operation_lambda:, error_code_mapping: {})
  begin
    operation_lambda.call
  rescue Sequel::Error => e
    write_error(error: e)
    http_code = error_code_mapping[ e.class.name.to_sym ] || 400
    halt(http_code, { message: "#{ e.message }" })
  end
end

begin
  DB=Sequel.connect('mysql2://' + ENV.fetch('MYSQLCS_CONNECT_STRING'),
    :user => ENV.fetch('MYSQLCS_USER_NAME'),
    :password => ENV.fetch('MYSQLCS_USER_PASSWORD'))
rescue Exception => e
  write_error(error: e)
end
