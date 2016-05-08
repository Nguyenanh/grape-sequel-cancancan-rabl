require 'sequel'
DB = Sequel.connect('postgres://admin:123456789@localhost:5432/grape-sequel')

Sequel::Model.plugin :schema

class User < Sequel::Model

  Sequel.extension :pagination
  
  set_schema do
    primary_key :id
    String :name
  end

  create_table unless table_exists?
end