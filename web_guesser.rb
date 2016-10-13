require 'sinatra'
require 'sinatra/reloader'

number = rand(101).to_s

get '/' do
  "The SECRET NUMBER is #{number}"
end
