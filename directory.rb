require 'color_text'
require 'csv'

def try_load_students
	filename = ARGV.first

		#return if filename.nil?
		if !filename.nil? && File.exist?(filename) 
			load_students_in_terminal(filename)
			interactive_menu
		else
			interactive_menu
		end
end


def load_students_in_terminal(filename = @filename)
		if File.exist?(filename)
			csv = CSV.read(filename)
			parse_to_load_file(csv)
			interactive_menu
		else
			puts "no valid filename!"
			interactive_menu
		end
end

def parse_to_load_file(line)
	line.each_with_index do |student, index|
		student = {month: line[index][0] , name: line[index][1], city: line[index][2], hobby: line[index][3]}
		@students << student
	end
end

def interactive_menu
	puts "Hey, choose your action, son:
	'i' input students
	'list' list students
	's' save students to list
	'l' load student from file
	'x' exit".neon
	selection = STDIN.gets.chomp
	interactive_menu_case(selection)
end

def interactive_menu_case(selection)
	case selection
		when "i"
			put_in_user
		when "list"
			student_list_print(@students)
		when "s"
			set_savefile_name
		when "l"
			load_students_by_filename
		when "x"
		else
			puts "I didn´t get that, try again!"
			interactive_menu
	end
end

def load_students_by_filename(filename = @filename)
	puts "Please enter name of file!"
	filename = STDIN.gets.chomp
		if File.exist?(filename)
			csv = CSV.read(filename)
			parse_to_load_file(csv)
			interactive_menu
		else
			puts "no valid filename!"
			interactive_menu
		end
end

def set_savefile_name
	puts "Please provide a filename for your savefile!"
	@filename = STDIN.gets.chomp
	save_student(@filename + ".csv")
end

def save_student(filename)
	File.open(filename, "w") do |file|
	@students.each do |student|
		parse_to_save_file(student, file)
		puts "File saved!"
		interactive_menu
	end
	#file.close
	end
end

def parse_to_save_file(student, file)
	student_data = [student[:name], student[:month], student[:city], student[:hobby]]
	csv_line = student_data.join(",")
	file.puts csv_line
end

@students = []
@months = ["january","february","march","april","may","june","july","august","september","october","november","december"]

def placeholder
	["placeholder", "placeholder", "placeholder", "placeholder"]
end

#give input to array students
def put_in_user
	#setting variables
	name, cohort, city, hobby = placeholder
    	#prompting the user for input and receiving it
		puts "Hey there, type your name".center(50)
		name = STDIN.gets.chomp
		
		puts "Put your cohort".center(50)
		cohort_input = STDIN.gets.chomp
		cohort = cohort_input.downcase
		
		puts "Put your city".center(50)
		city = STDIN.gets.chomp
		
		puts "Put your hobby".center(50)
		hobby = STDIN.gets.chomp

	validation_of_user_input(name, cohort, city, hobby)
		
end

def validation_of_user_input(name, cohort, city, hobby)
	#if all prompts were answered put data in students array
	
			if !name.empty? &&  ( !cohort.empty? && @months.include?("#{cohort}")) && !city.empty? && !hobby.empty?
				single_student = {month: "#{cohort}", name: name, city: city, hobby: hobby}
					@students << single_student
				list_or_continue_prompt
			elsif !@months.include?("#{cohort}") && !name.empty? && !cohort.empty? && !city.empty? && !hobby.empty?
				puts "You did´t enter a valid month, please try again!\n\n"
					put_in_user
			else name.empty? && cohort.empty? && city.empty? && hobby.empty?
				#prompt when u haven´t entered all information, calls put_in_user
				puts "Please fill in all fields\n!"
					list_or_continue_prompt
			end
end

def list_or_continue_prompt
	puts "For list, enter: 'list' ! To continue adding user, press enter! Type 'menu' to go back to the menu!".center(50)
	answer = STDIN.gets.chomp
	#if user wants to make more entries hit return, to see list enter list, calls student_list_printer
		if answer.downcase == "list" ; return student_list_print(@students) end
		if answer.downcase == "menu" ; return interactive_menu end
	put_in_user
end

def students_list_message
	print "Students list: \n______________\n"
	#print "Only students from the March and April cohort will be displayed!\n"
end

def no_entries_prompt
	puts "Sorry, no entries have been made! Therefore no list!\n"
	puts "To continue type 'continue', to quit type 'quit'. For back to menu, type 'menu'"
	answer = STDIN.gets.chomp
	case answer
		when "menu"
			interactive_menu
		when "continue" 
			put_in_user
		when "quit"  
		else 
			puts "you´re too dumb for this, goodbye!"
	end
end


def student_list_print(students=[])
	# puts students.inspect
	if students.size > 0 
		students_list_message
		sort_students = students.sort_by{|student| @months.index(student[:month])}
		sort_students.each_with_index{|student, counter| puts "#{counter + 1}. #{student[:month]}: #{student[:name]} from #{student[:city]} likes #{student[:hobby]}"}
		return how_many_students(students)
	else
		return no_entries_prompt
	end
end

def how_many_students(students)
	#puts @students array into a file
	#File.open("student", "w") { |f| f.write @students}
	#if only one student print student, with more print students
	if students.count > 1
		print "_________________\n"
		print "Overall, we have #{students.count} great students\n\n"
	else
		print "_________________\n"
		print "Overall, we have #{students.count} great student\n\n"
	end
	end_script?
end

def end_script?
	puts "Please choose your action!
	'q' quit
	'm' menu"
	answer = STDIN.gets.chomp

	case answer
		when "q" then exit
		when "m" then interactive_menu
		else 
		puts "Learn to type..."
		end_script?
	end
end

#start script
try_load_students



