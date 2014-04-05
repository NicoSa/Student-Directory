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
		cohort = gets.chomp
		puts "Put your height".center(50)
		city = gets.chomp
		puts "Put your hobby".center(50)
		hobby = gets.chomp
			#if all prompts were answered put data in students array
			if !name.empty? && !cohort.empty? && !height.empty? && !hobby.empty?
				@counter += 1
				single_student = {counter: @counter, name: name, cohort: cohort, city: city, hobby: hobby}
				@students << single_student
				puts "For list, enter: 'list' ! To continue adding user, press enter".center(50)
				answer = gets.chomp
				#if user wants to make more entries hit return, to see list enter list, calls student_list_printer
				if answer.downcase == "list" ; return student_list_print(@students) end
			else
				#prompt when u haven´t entered all information, calls put_in_user
				puts "Please fill in all the fields or your information will not be saved\n"
				put_in_user
			end
	end
end
#prints student list with a line
def students_list_message
	print "Students list: \n______________\n"
end

def student_list_print(students)
	students_list_message
	#select all students from the student array and print each one in a new line when the name is not longer than 12 characters
	students.select{|student| if student[:name].length <= 12 then puts "#{student[:counter]}.#{student[:name]}, #{student[:cohort]} cohort, #{student[:city]}, likes #{student[:hobby]}! " end}
	#call how_many_students method
	how_many_students(students)
end

# def student_list_print(students)
# 	students_list_message
# 	students.each do |student| 
# 	if student[:name].downcase.chars.first != "a" then print "#{x}. #{student[:name]} from the #{student[:cohort].capitalize} cohort\n"
# 	if student[:name].size < 12 then print "#{student[:counter]}. #{student[:name]} from the #{student[:cohort].capitalize} cohort\n" end
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
