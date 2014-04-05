#welcome message, calls put in user
def start_script
		print "Hi, please enter students!\n".center(30)
		put_in_user
end
#setting empty array students as instance variable
@students = []
@counter = 0
#give input to array students
def put_in_user
	#setting variables
	name = "placeholder"
	cohort = "placeholder"
	height = "placeholder"
	hobby = "placeholder"
	answer = ""
    #as long input is not empty it will run the loop
    while !name.empty? do
    	#prompting the user for input and receiving it
		puts "Hey there, type your name".center(50)
		name = gets.chomp
		puts "Put your cohort".center(50)
		@cohort = gets.chomp
		@cohort.downcase.capitalize
		puts "Put your height".center(50)
		city = gets.chomp
		puts "Put your hobby".center(50)
		hobby = gets.chomp
			#if all prompts were answered put data in students array
			if !name.empty? && !cohort.empty? && !height.empty? && !hobby.empty?
				@counter += 1
				single_student = {"#{@cohort}" => {counter: @counter, name: name, city: city, hobby: hobby}}
				@students << single_student
				puts "For list, enter: 'list' ! To continue adding user, press enter".center(50)
				answer = gets.chomp
				#if user wants to make more entries hit return, to see list enter list, calls student_list_printer
				if answer.downcase == "list" ; return student_list_print(@students) end
			else
				#prompt when u haven´t entered all information, calls put_in_user
				puts "Please fill in all the fields or your information will not be saved\n\n"
				put_in_user
			end
	end
end
#prints student list with a line
def students_list_message
	print "Students list: \n______________\n"
	print "Only students from the March and April cohort will be displayed!\n"
end

def student_list_print(students)
	students_list_message
	#select all students from the student array and print each one in a new line when the name is not longer than 12 characters
	students.select{|student| 
	puts "March cohort\n"
	for x in student.size do
		puts "#{student["March"][:counter]}.#{student["March"][:name]} from #{student["March"][:city]}, likes #{student["March"][:hobby]}! " 
	end
	puts "April cohort\n"
	for x in student.size do 
		puts "#{student["April"][:counter]}.#{student["April"][:name]} from #{student["April"][:city]}, likes #{student["April"][:hobby]}! " 
	end
	
}
	#call how_many_students method
	how_many_students(students)
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
