def input_students
  # create an empty array
  students = []

  while true do

    puts "Please enter the name of the student or hit return to exit."
    name = gets.chomp

      break if name.empty?

      puts "Please enter the cohort they are joining (November as default)"
      cohort = gets.chomp

        puts "Please enter any hobbies"
        hobbies = gets.chomp

        puts "Please enter country of birth"
        birth = gets.chomp

        puts "Please enter height (cm)"
        height = gets.chomp

        puts "Please enter weight (kg)"
        weight = gets.chomp
  

  # while the name is not empty, repeat this code
    # add the student hash to array
    students << {name: name,
      cohort: cohort,
      hobbies: hobbies,
      birth: birth,
      height: height,
      weight: weight}

    puts plural_singular(students)
    # get another name from the user
    name = gets.chomp
  end
    students
end

def print_header
puts "The students of Villain Academy"
puts "-----------"
end

def print_default(students)
  students.each_with_index do |student, index|
    puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort),
    born in #{student[:birth]}, currently #{student[:height]} cm tall, weighing #{student[:weight]} kg,
    enjoys #{student[:hobbies]} as a hobby."
  end
end

def plural_singular(students)
  if students.count > 1
    puts "Now we have #{students.count} students."
  elsif students.count == 1
    puts "Now we have #{students.count} student."
  end
end

def print_footer(students)
  if students.count == 1
  puts "Overall, we have #{students.count} great student"
else
  puts "Overall, we have #{students.count} great students"
end
end


students = input_students
print_header
print_default(students)
print_footer(students)
