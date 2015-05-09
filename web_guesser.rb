require 'sinatra'

number = rand(101)

get '/' do
  erb :index, :locals => {:number => number}
end