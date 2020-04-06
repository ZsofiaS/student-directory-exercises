def input_students
  puts "Please enter the names of the students"
  students = []
  name = gets.chomp
  puts "Please enter country of birth"
  puts "To finish, just hit return twice"
  country = gets.chomp
  while !name.empty? do
    students << {name: name, country: country, cohort: :november}
    puts "Now we have #{students.count} students"
    name = gets.chomp
    country = gets.chomp
  end
  students
end

# Print the list of students
def print_header
  puts "The students of Villains Academy".center(45)
  puts "-------------".center(45)
end

def print(students)
  n = 0
  while n < students.length
    puts "#{students[n][:name].center(15)} #{students[n][:country]} (#{students[n][:cohort]} cohort)"
    n += 1
  end
end

def print_footer(students)
# print the total number of students
  puts "Overall, we have #{students.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)
