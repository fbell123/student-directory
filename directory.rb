def input_students
  puts "Please enter the name of the students."
  puts "To finish, return through the questions."
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
puts "The students of Villain Academy".center(40)
puts "-----------".center(40)
end

def print(students)
  students.each_with_index do |student, index|
    puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)".center(40)
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students".center(40)
end


students = input_students
print_header
print(students)
print_footer(students)
