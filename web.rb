require 'sinatra'
require 'sinatra/reloader'
  
rando = rand(1..100)
get '/' do 
  "Secret number: #{rando}".upcase
end
