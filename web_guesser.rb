require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(101)
$correct_guess = false

def check_guess(guess)
  @guess = guess.to_i

  if @guess == 0
    "Guess a number between 1 and 100!"
  elsif @guess > (SECRET_NUMBER + 5)
    "Way too high!"
  elsif @guess > SECRET_NUMBER
    "Too high!"
  elsif @guess < (SECRET_NUMBER - 5)
    "Way too low!"
  elsif @guess < SECRET_NUMBER
    "Too low!"
  elsif @guess == SECRET_NUMBER
    $correct_guess = true
    "You got it right!"
  end
end

get '/' do
  guess = params["guess"]
  message = check_guess(guess)

  erb :index, :locals => { :number => SECRET_NUMBER, :message => message, :correct_guess => $correct_guess }
end
