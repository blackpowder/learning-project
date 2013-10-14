
def check_answer_input
	equation = new_equation(@range)
	answer = false

	while answer == false
		puts equation
		result = eval equation
		puts "{answer: #{result}}"
		answer_user = gets.chomp

		if answer_user.downcase == "q"              #make a new method for if ???
			exit
		elsif answer_user.to_i == result
			puts "Correct!"
			check_answer_input
		else
			puts "Try again"
		end
	end
end

def new_equation(range)
	number1 = rand(range)
	number2 = rand(range)
	number3 = rand(range)
	number4 = rand(range)

	operator1 = get_operator
	operator2 = get_operator
	operator3 = get_operator

	"#{number1}  #{operator1} #{number2}  #{operator2} #{number3}  #{operator3} #{number4}"
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
check_answer_input
