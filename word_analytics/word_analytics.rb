input_file = ARGV[0]

current_file = File.open(input_file)

def print_all(f)
  puts f.read()
end

def count_file_parts_split_by(f, split_pattern = " ") 
	f.seek(0)
	elements = []
	f.each_line do |line|
		line = line.split(split_pattern)
		line.each do |element|
			element = element.downcase.gsub(/[^a-z]/,'')
			elements << element if element.size > 0
		end
	end
	elements.count
end

def actual_words(f) 
	count = count_file_parts_split_by(f)
	puts "\"#{count} words\", where #{count} is the number of words in the given document"	
end

def actual_letters(f)
	count = count_file_parts_split_by(f, //)
	puts "\"#{count} letters\", where #{count} is the number of letters in the given document"
end



#print_all(current_file)
actual_words(current_file)
actual_letters(current_file)







