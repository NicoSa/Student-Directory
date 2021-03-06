require 'color_text'
require 'csv'

#checks if file was passed and if valid puts csv data into students arraya
def start_script
  filename = ARGV.first
  if !filename.nil? && File.exist?(filename)
    load_student_from_command(filename)
    interactive_menu
  else
    interactive_menu
  end
end

#check if csv file is valid and passes data then forwards to menu
def load_student_from_command(filename = @filename)
  if File.exist?(filename)
    csv = CSV.read(filename)
    parse_to_load_file(csv)
    interactive_menu
  else
    puts "no valid filename!"
    interactive_menu
  end
end

#extracts data from csv and adds to student array
def parse_to_load_file(csv)
  csv.each_with_index do |student, index|
    student = {month: csv[index][0] , name: csv[index][1], city: csv[index][2], hobby: csv[index][3]}
    @students << student
  end
end

#choose your action
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

#choose your action
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

#type filename, if available csv is loaded, if not go back to menu
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

#set a name for your savefile
def set_savefile_name
  puts "Please provide a filename for your savefile!"
  @filename = STDIN.gets.chomp
  save_student(@filename + ".csv")
end

#saves your input to csv file
def save_student(filename)
  File.open(filename, "w") do |file|
    @students.each do |student|
      parse_to_save_file(student, file)
      puts "File saved!"
      interactive_menu
    end
  end
end

def parse_to_save_file(student, file)
  student_data = [student[:name], student[:month], student[:city], student[:hobby]]
  csv_line = student_data.join(",")
  file.puts csv_line
end

#students array
@students = []
#array of months, used to test if a valid month was entered
@months = ["january","february","march","april","may","june","july","august","september","october","november","december"]

#just a placeholder to introduce some variables
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

#if all prompts were answered put data in students array
def validation_of_user_input(name, cohort, city, hobby)

  if !name.empty? &&  ( !cohort.empty? && @months.include?("#{cohort}")) && !city.empty? && !hobby.empty?
    single_student = {month: "#{cohort}", name: name, city: city, hobby: hobby}
    @students << single_student
    list_or_continue_prompt
  elsif !@months.include?("#{cohort}") && !name.empty? && !cohort.empty? && !city.empty? && !hobby.empty?
    puts "You did´t enter a valid month, please try again!\n\n"
    put_in_user
#prompt when u haven´t entered all information, calls put_in_user
  else name.empty? && cohort.empty? && city.empty? && hobby.empty?
    puts "Please fill in all fields\n!"
    list_or_continue_prompt
  end
end

#if user wants to make more entries hit return, to see list enter list, calls student_list_printer
def list_or_continue_prompt
  puts "For list, enter: 'list' ! To continue adding user, press enter! Type 'menu' to go back to the menu!".center(50)
  answer = STDIN.gets.chomp
  if answer.downcase == "list" ; return student_list_print(@students) end
  if answer.downcase == "menu" ; return interactive_menu end
  put_in_user
end

#print "Only students from the March and April cohort will be displayed!\n"
def students_list_message
  print "Students list: \n______________\n"
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


# puts students.inspect
def student_list_print(students=[])
  if students.size > 0
    students_list_message
    sort_students = students.sort_by{|student| @months.index(student[:month])}
    sort_students.each_with_index{|student, counter| puts "#{counter + 1}. #{student[:month]}: #{student[:name]} from #{student[:city]} likes #{student[:hobby]}"}
    return how_many_students(students)
  else
    return no_entries_prompt
  end
end

#puts @students array into a file
#File.open("student", "w") { |f| f.write @students}
#if only one student print student, with more print students
def how_many_students(students)
  if students.count > 1
    print "_________________\n"
    print "Overall, we have #{students.count} great students\n\n"
  else
    print "_________________\n"
    print "Overall, we have #{students.count} great student\n\n"
  end
  end_script?
end

#appears at the end of every action to ensure you can go back to the menu
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
start_script
