def hello
		print "Hi, please enter students!\n".center(30)
		multiple_user_inputer
end

@students = []

def multiple_user_inputer(*students)
	name = "Noentry"
	cohort = "Noentry"
	height = "Noentry"
	hobby = "Noentry"
	answer = ""
    while !name.empty? do
		puts "Hey there, type your name".center(50)
		name = gets.chomp
		puts "Put your cohort".center(50)
		cohort = gets.chomp
		puts "Put your height".center(50)
		city = gets.chomp
		puts "Put your hobby".center(50)
		hobby = gets.chomp
			if !name.empty? && !cohort.empty? && !height.empty? && !hobby.empty?
				single_students = {name: name, cohort: cohort, city: city, hobby: hobby}
				@students << single_students
				puts "For list, enter: 'list' ! To continue adding user, press enter".center(50)
				answer = gets.chomp
				if answer.downcase == "list" ; return printer(@students) end
			else
				puts "Please fill in all the fields or your information will not be saved"
				multiple_user_inputer
			end
	end
end

def student_list_message
	print "Students list: \n______________\n"
end

def printer(students)
	student_list_message
	students.select{|student| if student[:name].length <= 12 then puts "#{student[:name]}, #{student[:cohort]} cohort, #{student[:city]}, likes #{student[:hobby]}! " end}

	print_footer(students)
end

def print_footer(students)
	if students.count > 1
	print "_________________\n"
	print "Overall, we have #{students.count} great students"
	else
	print "_________________\n"
	print "Overall, we have #{students.count} great student"
	end
end


#user_input
hello
