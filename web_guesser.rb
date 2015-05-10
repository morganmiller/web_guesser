require 'sinatra'

SECRET_NUMBER = rand(100)

def check_guess(guess)
  difference = guess - SECRET_NUMBER
  
  if difference.between?(1,5)
  	"Too high!"
  elsif difference.between?(-5,-1)
  	"Too low!"
  elsif difference == 0
	"You got it right!"
  elsif difference > 5
 	"Way too high!"
  elsif difference < -5
	"Way too low!"
  end
end

get '/' do
  guess = params['guess'].to_i
  message = check_guess(guess)
  erb :index, :locals => {:number => SECRET_NUMBER, :message => message}
end