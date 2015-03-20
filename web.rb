require 'sinatra'
require 'sinatra/reloader'

$number = rand(1..100)

get '/' do 
  # throw params.inspect
  message = guess_checker(params["guess"].to_i)
  erb :index, :locals => {:number => $number, 
                          :message => message
                         }
  #guess_checker
end

def guess_checker(guess)
  if guess > $number
    "too high"
  else 
    "too low"
  end
end
