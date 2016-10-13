require 'sinatra'
require 'sinatra/reloader'

number = rand(101)
correct_guess = false

get '/' do
  @guess = params["guess"].to_i

  if @guess == 0
    message = "Guess a number between 1 and 100!"
  elsif @guess > (number + 5)
    message = "Way too high!"
  elsif @guess > number
    message = "Too high!"
  elsif @guess < (number - 5)
    message = "Way too low!"
  elsif @guess < number
    message = "Too low!"
  elsif @guess == number
    message = "You got it right!"
    correct_guess = true
  end

  erb :index, :locals => { :number => number, :message => message, :correct_guess => correct_guess }
end
