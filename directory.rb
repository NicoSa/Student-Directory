#welcome message, calls put in user
def start_script
		print "Hi, please enter students!\n\n".center(30)
		#puts @months.inspect
		put_in_user
end
#setting empty array students as instance variable
@students = []
@months = ["january","february","march","april","may","june","july","august","september","october","november","december"]
#give input to array students
def put_in_user
	#setting variables
	name, cohort, height, hobby = "placeholder", "placeholder", "placeholder", "placeholder"
	answer = ""
    #as long input is not empty it will run the loop
    while !name.empty? do
    	#prompting the user for input and receiving it
		puts "Hey there, type your name".center(50)
		name = gets.chomp
		puts "Put your cohort".center(50)
		cohort_input = gets.chomp
		@cohort = cohort_input.downcase
		puts "Put your height".center(50)
		city = gets.chomp
		puts "Put your hobby".center(50)
		hobby = gets.chomp
			#if all prompts were answered put data in students array
			if !name.empty? &&  ( !@cohort.empty? && @months.include?("#{@cohort}")) && !height.empty? && !hobby.empty?
					single_student = {month: "#{@cohort}", name: name, city: city, hobby: hobby}
					@students << single_student
				puts "For list, enter: 'list' ! To continue adding user, press enter".center(50)
				answer = gets.chomp
					#if user wants to make more entries hit return, to see list enter list, calls student_list_printer
					if answer.downcase == "list" ; return student_list_print(@students) end

			elsif !@months.include?("#{@cohort}") && !name.empty? && !@cohort.empty? && !height.empty? && !hobby.empty?
				puts "You did´t enter a valid month, please try again!\n"
				return put_in_user
			else name.empty? && @cohort.empty? && height.empty? && hobby.empty?
				#prompt when u haven´t entered all information, calls put_in_user
				puts "Please fill in all fields\n!"
				puts "If you want to go to the list instead, type 'list'! Otherwise press return."
				answer = gets.chomp
				if answer.downcase == "list" ; return student_list_print(@students) end
				put_in_user
			end
	end
end
#prints student list with a line
def students_list_message
	print "Students list: \n______________\n"
	#print "Only students from the March and April cohort will be displayed!\n"
end


def student_list_print(students)
	# puts students.inspect
	if students.size > 0 
	students_list_message
	students.sort_by{|student| student[:month]}.each_with_index{|student, counter| puts "#{counter + 1}. #{student[:month]}: #{student[:name]} from #{student[:city]} likes #{student[:hobby]}"}
	how_many_students(students)
	else
		puts "Sorry, no entries have been made! Therefore no list!\n"
		puts "To continue type 'continue', to quit type 'quit'"
		answer = gets.chomp
			case answer
				when "continue" 
				put_in_user
				when "quit"  
				else 
				puts "you´re to dumb for this, goodbye!"
			end
	end
	# puts "#{@fuck} cohort:\n"
	#@fuck.each_with_index{|student, counter| puts "#{counter + 1}. #{student[@fuck][:name]} from #{student[@fuck][:city]} likes #{student[@fuck][:hobby]}"}
	
	# students.select{|student| if student.has_key?("april") then @april_cohort << student end} 
	# puts "April cohort:\n"
	# @april_cohort.each_with_index{|student, counter| puts "#{counter + 1}. #{student["april"][:name]} from #{student["april"][:city]} likes #{student["april"][:hobby]}"}

	
	#call how_many_students method
end



# def student_list_print(students)
# 	students_list_message
# 			#filter by starting letter of names
# 			puts "Please type the starting letter of names you´d like to be filtered!"
# 			filter_letter = gets.chomp
# 			students.each do |student| 
# 			if student[:name].downcase.chars.first != filter_letter then print "#{student[:counter]}. #{student[:name]} from the #{student[:cohort].capitalize} cohort\n" end
# 			#filter by characters in name
# 			puts "Please type the number of characters in a number where you want to not have it display in the list anymore "
# 			filter_number = gets.chomp
# 			if student[:name].size < filter_number then print "#{student[:counter]}. #{student[:name]} from the #{student[:cohort].capitalize} cohort\n" end
# 	end
# 	how_many_students(students)
# end

def how_many_students(students)
	#if only one student print student, with more print students
	if students.count > 1
	print "_________________\n"
	print "Overall, we have #{students.count} great students"
	else
	print "_________________\n"
	print "Overall, we have #{students.count} great student"
	end
end


#starts script
start_script
