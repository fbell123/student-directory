require 'csv'

@students = []

def print_menu
  puts
  puts "Please select from the follow options:"
  puts
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
  puts
end

def interactive_menu
  load_students
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students
  when "4"
    load_students
  when "9"
    exit
  else
    puts "I don't know what you mean, try again"
  end
end

def input_students
  puts
  puts "Please enter the name of the student"
  puts "To finish, just hit return twice"
  # get the first name
  while true
    name = user_input("Students name? Double return to exit.")
    break if name.empty? # allow an exit if the name is empty
    cohort = user_input("Which cohort?(default November)", 'November')
    # make sure all information input is correct
    check_info(name, cohort)
  end
end

# require all the information from the user before progressing
def user_input(question, default = '')
  puts question
  answer = STDIN.gets.chomp
  if answer == ''
    answer = default
  end
  answer
end

# method to make sure that all information is correct
def check_info(name, cohort)
  puts
  puts "Is the below information correct?"
  puts
  puts "Name: #{name}"
  puts "Cohort: #{cohort}"
  puts
  puts "If this is incorrect type 'no', else hit enter to carry on"
  answer = STDIN.gets.chomp
  if answer == 'no'
    puts "Information deleted, please re-enter"
  else
    add_info({name: name.to_sym, cohort: cohort.to_sym})
    puts "Information added"
    puts "---------"
  end
end

def add_info(info)
  @students << info
end

def show_students
  print_header
  print_student_list
  print_footer
end

def print_header
  puts "The students of Villain Academy"
  puts "-----------"
end

def print_student_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  if @students.count == 1
    puts "Overall we have #{@students.count} student"
  else
    puts "Overall we have #{@students.count} students"
  end
end

def save_students
  # open the file for writing
  save_file = "students.csv"
  CSV.open(save_file, "w") do |file|
    # iterate over the array of students
    @students.each do |student|
      student_data = [student[:name], student[:cohort]]
      csv_line = student_data.join(",")
      file << student_data
    end
    puts "---Student saved---"
  end
end

def load_students(filename = 'students.csv')
  CSV.foreach(filename) do |line|
  name, cohort = line.join(',').split(',')
    add_info({name: name.to_sym, cohort: cohort.to_sym})
  end
  puts "---'#{filename}' loaded---"
end

# method redundant now - load_students pulls through and works
def try_load_students
  filename = ARGV.first# first argument from the command line
  return if filename.nil? # get out of the method if it isn't given
  if File.exists?(filename) # if it exists
    load_students(filename)
     puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end


try_load_students
interactive_menu
print_cohorts
