require 'sinatra'
require 'mysql2'

set :bind, '0.0.0.0'

db = Mysql2::Client.new(
  :host => 'db',
  :username => 'root',
  :database => 'memo'
)

get '/' do
  sql = "select * from memo limit 10"
  @array = Array.new
  db.query(sql).each {|row| @array << row}
  erb :index
end

post '/' do
  memo = params[:memo]
  sql = "insert into memo (memo) values ('#{memo}')"
  db.query(sql)
  sql = "select * from memo limit 10"
  @array = Array.new
  db.query(sql).each {|row| @array << row}
  erb :index
end