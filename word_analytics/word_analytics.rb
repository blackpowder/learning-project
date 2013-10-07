input_file = ARGV[0]

current_file = File.open(input_file)

#todo - rename select to smomething clearer - it isn't selecting the characters in the pattern it is removing them, I would think of something like filter_pattern
def file_parts_split_by(f, split_pattern = " ", select = /[^a-z]/ )
	f.seek(0)
	elements = []
	f.each_line do |line|
		line = line.split(split_pattern)
		line.each do |element|
			element = element.downcase.gsub(select,'')
			elements << element if element.size > 0
		end
	end
	elements
end

def count_file_parts_split_by(f, split_pattern = " ", select = /[^a-z]/ ) 
	elements = file_parts_split_by(f, split_pattern, select)
	elements.count
end

def actual_words(f) 
	count = count_file_parts_split_by(f)
	puts "#{count} words" unless count == 0
end

def actual_letters(f)
	count = count_file_parts_split_by(f, //)
	puts "#{count} letters" unless count == 0
end

def actual_symbols(f)
	count = count_file_parts_split_by(f, //, /[a-z0-9\s]/ )
	puts "#{count} symbols" unless count == 0	
end

def order_common_elements(f, split = " ")

	elements = file_parts_split_by(f, split)

	elements_order = elements.inject(Hash.new(0)) {|counts, word_list| counts[word_list] += 1; counts }
	sorted_words = elements_order.sort_by {|key, value| value}
	element_keys = sorted_words.collect {|item| item[0]}

  #todo - use array slice to get the common elements
  #todo - return the common elements as an array instead of instance variables
	@common_element_1 = element_keys[-1]
	@common_element_2 = element_keys[-2] 
	@common_element_3 = element_keys[-3]	
end

def common_words(f)
	common_words = order_common_elements(f)

  #todo get common_elements from the return value and not instance variables
	unless @common_element_1 == nil or @common_element_2 == nil or @common_element_3 == nil
		puts "Top three most common words:  #{@common_element_1}, #{@common_element_2}, #{@common_element_3}"
	end #do i need to put unless in one line ? i wrote on 3 line because the puts was quite long
end

def common_letters(f)
	common_letters = order_common_elements(f, //)

  #todo get common_elements from the return value and not instance variables
	unless @common_element_1 == nil or @common_element_2 == nil or @common_element_3 == nil
		puts "Top three most common letters: #{@common_element_1}, #{@common_element_2}, #{@common_element_3}"
	end
end

actual_words(current_file)
actual_letters(current_file)
actual_symbols(current_file)
common_words(current_file)
common_letters(current_file) #i don't know if it's the best way to call the methods, or i need to call in each method


#todo (optional) - convert code to objects - FileAnalyser and FileSplitter classes



