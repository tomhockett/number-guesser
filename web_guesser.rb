require 'sinatra'
require 'sinatra/reloader' if development?

SECRET_NUMBER = 1 + rand(99)
$correct = false


get '/' do
  guess = params["guess"]
  message = check_guess(guess)
  bg_color = css_color(message)

  erb :index, :locals => { :number => SECRET_NUMBER, :message => message, :correct_guess => $correct, :bg_color => bg_color }
end

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
    $correct = true
    "You got it right!"
  end
end

def css_color(message)
  case message
  when "Way too high!" then "#FFFFFF"
  when "Too high!" then "#FF9473"
  when "Way too low!" then "#FF9473"
  when "Too low!" then "#FF9473"
  end
end
