def new_equation(range)
	number1 = rand(range)
	number2 = rand(range)
	number3 = rand(range)
	number4 = rand(range)

	operator1 = get_operator
	operator2 = get_operator
	operator3 = get_operator

	@equation = "#{number1}  #{operator1} #{number2}  #{operator2} #{number3}  #{operator3} #{number4}"
	check_answer_input
end

def check_answer_input
	puts @equation
	result = eval @equation
	#puts result
	answer_user = gets.chomp

	if answer_user.downcase == "q"
		exit
	elsif answer_user.to_i == result.to_i
		puts "Correct!"
		new_equation(@range)
	else
		puts "Try again"
		check_answer_input
	end
end

def get_input_range
	range = gets.chomp.split(' ')
	low = range[0].to_i
	high = range[1].to_i 
	low...high
end

def get_operator
	operators = ["*", "+", "-"]
	operators[rand(operators.size)]
end

@range = get_input_range
new_equation(@range)



#todo get range of 2 integer from the user

#todo print random singke eq 

#answer
#correct : print "Correct!" then new eq
# else "Try Again" call the same equation

#q or Q to finish the game