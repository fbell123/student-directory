def input_students
  puts "Please enter the name of the students."
  puts "To finish, just hit return twice."
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to array
    students << {name: name, cohort: :November}
    puts "Now we have #{students.count} students."
    # get another name from the user
    name = gets.chomp
  end

    students
end


def print_header
puts "The students of Villain Academy"
puts "-----------"
end

def print(students)
  students.each_with_index do |student, index|
    puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_letter(students)
  selects_students = students.select{|student| student[:name][0] == "D"}
  selects_students.each do |student|
    puts student[:name]
end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end


students = input_students
print_header
print_letter(students)
print_footer(students)
