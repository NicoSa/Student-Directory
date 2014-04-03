
def multiple_user_inputer(*students)
	print "Hi, please enter students!\n".center(30)
	students = []
	name = "placeholder"
	cohort = "placeholder"
	height = "placeholder"
	hobby = "placeholder"
	answer = ""
    while !name.empty? do
		puts "Hey there, type your name".center(50)
		name = gets.chomp
		puts "Put your cohort".center(50)
		cohort = gets.chomp
		puts "Put your height".center(50)
		height = gets.chomp
		puts "Put your hobby".center(50)
		hobby = gets.chomp
		single_students = {name: name, cohort: cohort, height: height, hobby: hobby}
		students << single_students
		puts "For list, enter: 'list' ! To continue adding user, press enter".center(50)
		answer = gets.chomp
		if answer.downcase == "list" ; return printer(students) end
	end
	printer(students)
	
end

# def user_input
# 	print "Hi, please enter students!\n"
# 	name = gets.chomp
# 	students = []
# 		while !name.empty? do
# 		students << {:name => name, :cohort => "March"}
# 		name = gets.chomp
# 		end
# 	printer(students)
# end

def student_list_message
	print "Students list: \n______________\n"
end


def printer(students)
	x = 0
	student_list_message
	while x < students.count
	print "#{x + 1}. #{students[x][:name]} from the #{students[x][:cohort].capitalize} cohort\n"
	x += 1
	end

	print_footer(students)
end


def print_footer(students)
	
	print "_________________\n"
	print "Overall, we have #{students.count} great students"
end


#user_input
multiple_user_inputer

