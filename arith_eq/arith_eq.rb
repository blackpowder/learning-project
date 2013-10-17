#I think it would be better to split this into smaller methods
def check_answer_input #this method both prints and checks the answer
	equation = new_equation2(@range)
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
			check_answer_input
		else
			puts "Try again"
		end
	end
end

def new_equation2(range)
	equation = ''
	3.times { equation << "#{rand(range)} #{get_operator} "}
	equation << rand(range).to_s
end

#see above for a bit of a shorter way to do the same thing
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

#because this is called first I would put it as the first method in the file
def get_input_range
	range = gets.chomp.split(' ')
	low = range[0].to_i #I like how you explicitly created low and high variables, makes it clear what the input does.
	high = range[1].to_i 
	low...high
end

#nicely done
def get_operator
	operators = ["*", "+", "-"]
	operators[rand(operators.size)]
end

#since @range is only used in one other place I would suggest shifting it back to passing as a parameter to check_answer_input
@range = get_input_range
check_answer_input
