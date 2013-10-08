def fizzbuzz(low = 1, high = 100)
	(low..high).collect do |number|
		result = ""	
		result << "Fizz" if number %3 == 0
		result << "Buzz" if number %5 == 0 
		result.empty? ? number : result
	end	
end

puts fizzbuzz



