require 'sinatra'
require 'sinatra/reloader'

NUMBER = rand(100)

def check_guess(guess)
	guess = guess.to_i
	if (params['guess'].to_i - 5) > NUMBER
		"That number is way too high!"
	elsif (params['guess'].to_i + 5).to_i < NUMBER
		 "That number is way too low!"
	elsif params['guess'].to_i < NUMBER
		"That number is too low"	
	elsif params['guess'].to_i > NUMBER
		"That number is too high"
	elsif params['guess'].to_i === NUMBER
		"That number is just right! The secret number is #{guess}"
	end
end

def set_color(message, guess)
	case message
		when "That number is way too high!" then 'red'
		when "That number is way too low!" then 'red'
		when "That number is too low" then 'lightblue'
		when "That number is too high" then 'lightblue'
		when "That number is just right! The secret number is #{guess}" then 'lime'

	end
	
end



get '/' do
	guess = params["guess"]
	message = check_guess(guess)
	background_color = set_color(message, guess)
	erb :index, :locals => {:number => NUMBER, :message => message, :background_color => background_color } 
	#throw params.inspect
end

