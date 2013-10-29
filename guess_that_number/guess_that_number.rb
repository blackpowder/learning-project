def guess_that_number(low = 1, high = 100)
	puts "Welcome to guess-that-numbers game! I have already picked a number in [1, 100]. Please make a guess. Type \"exit\" to quit."
	number_to_guess = rand(low..high)
	answer = ""
	while answer != number_to_guess
		answer = gets.chomp
		check_the_answer(answer, number_to_guess)
	end
end

def check_the_answer(answer, number_to_guess)
	answer_number = answer.to_i

	if answer == 'exit'
		exit
	elsif answer_number == number_to_guess
		puts "Correct! That is my number, you win! <Program terminates>"
	elsif answer_number < number_to_guess and answer_number >= 1
		puts "Wrong. That number is below my number."
	elsif answer_number > number_to_guess and answer_number <= 100
		puts "Wrong. That number is above my number."
	else
		puts "Wrong guess"
	end
end

guess_that_number
