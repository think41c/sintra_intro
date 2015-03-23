require 'sinatra'
require 'sinatra/fix_951'
require 'sinatra/reloader' if development? 

@@guesses = 0 

get '/' do
  start
  cheat_code = check_cheat(params["cheat"])
  guess      = params["guess"].to_i
  erb :index, :locals => {:number => @@rand, :message => guess_checker(guess, @@rand), :cheater => cheat_code}
end

def check_cheat(cheat)
  if cheat == nil 
    "Not a cheater" 
  elsif cheat == "true"
    "The secret #{@@rand}"
  end
end

def randz
  @@rand = rand(101)
end

def start
  if @@guesses == 0
    @@guesses = 1
    randz
  elsif @@guesses == 5
    @@guesses = 1
    randz
  else 
    @@guesses += 1 
    @@rand
  end
end

def guess_checker(guess, random)
  if guess > random
    {toney: "Too high", background: "red", count: @@guesses}
  elsif   random == guess
    {toney: "Correct. The SECRET NUMBER is (#{random})", background: "blue", count: @@guesses}
  else
    {toney: "Too low", background: "yellow", count: @@guesses}
  end
end
