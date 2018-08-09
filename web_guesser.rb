require 'sinatra'
require 'sinatra/reloader'

number = rand(100)

def check_guess(guess)
	guess = guess.to_i
	if (params['guess'].to_i - 5) > guess
		"That number is way too high!"
	elsif (params['guess'].to_i + 5).to_i < guess
		"That number is way too low!"
	elsif params['guess'].to_i < guess
		"That number is too low!"	
	elsif params['guess'].to_i > guess
		"That number is too high!"
	elsif params['guess'].to_i === guess
		"That number is just right! The secret number is #{guess}"
	end
end

get '/' do
	guess = params["guess"]
	message = check_guess(guess)
	erb :index, :locals => {:number => number, :message => message } 
	#throw params.inspect
end

