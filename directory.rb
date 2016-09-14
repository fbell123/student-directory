def input_students
  puts "Please enter the name of the students."
  puts "To finish, return through the questions."
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  puts "What hobbies do they have?"
  hobby = gets.chomp
  puts "Where were they born?"
  birthplace = gets.chomp
  puts "What is their height(cm)?"
  height = gets.chomp
  puts "What is their weight(kg)?"
  weight = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to array
    students << {name: name, cohort: :November, hobby: hobby, pob: birthplace, height: height, weight: weight}
    puts "Now we have #{students.count} students."
    # get another name from the user
    puts "Name?"
    name = gets.chomp
    puts "Hobbies?"
    hobby = gets.chomp
    puts "Born?"
    birthplace = gets.chomp
    puts "Height?"
    height = gets.chomp
    puts "Weight?"
    weight = gets.chomp
  end

    students
end

def print_header
puts "The students of Villain Academy"
puts "-----------"
end

# Exercise 5 -
# Adding in additional information
def print_extras(students)
  students.each_with_index do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort) - Weight: #{student[:weight]} kg
    - Height: #{student[:height]} cm - Hobbies: #{student[:hobby]} - Birthplace: #{student[:pob]}"
  end
end
# code end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end


students = input_students
print_header
print_extras(students)
print_footer(students)
