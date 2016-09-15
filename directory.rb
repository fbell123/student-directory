def input_students
  puts "Please enter the name of the student."
  puts "Hit return twice to exit."
  # create an empty array
  students = []

  while true do

    puts "Please enter the name of the student or hit return to exit."
    name = gets.chomp

      break if name.empty?

      puts "Please enter the cohort they are joining (November as default)"
      cohort = gets.chomp

      if cohort.empty?
        cohort = "November" if cohort.empty?
      end

  # while the name is not empty, repeat this code
    # add the student hash to array
    students << {name: name, cohort: cohort}
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

def print_default(students)
  students.each_with_index do |student, index|
    puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end


students = input_students
print_header
print_default(students)
print_footer(students)
