def get_input_range
	range = gets.chomp.split(' ')
	low = range[0].to_i 
	high = range[1].to_i 
	low...high
end

#I think it would be better to split this into smaller methods
def check_answer_input(range) #this method both prints and checks the answer

	equation = new_equation(range)
	answer = false

	while answer == false
		puts equation
		result = eval equation
		puts "{answer: #{result}}"
		answer_user = gets.chomp

		if answer_user.downcase == "q"              #make a new method for if ??? - yes, I would make a new method
			exit
		elsif answer_user.to_i == result
			puts "Correct!"
			check_answer_input(range)
		else
			puts "Try again"
		end
	end
end

def new_equation(range)
	equation = ''
	3.times { equation << "#{rand(range)} #{get_operator} "}
	equation << rand(range).to_s
end

def get_operator
	operators = ["*", "+", "-"]
	operators[rand(operators.size)]
end

range = get_input_range
check_answer_input(range)
