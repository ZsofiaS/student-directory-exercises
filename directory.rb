def input_students
  puts "Please enter the names of the students"
  students = []
  name = gets.chomp
  while !name.empty? do
    puts "Please enter country of birth"
    country = gets.chomp
    puts "Please enter cohort"
    puts "To finish, just hit return twice"
    cohort = gets.chomp.to_s
    if country.empty? 
      country = "N/A"
    end
    if cohort.empty?
      cohort = "N/A"
    end
    students << {name: name, country: country, cohort: cohort}
    puts "Now we have #{students.count} students"
    name = gets.chomp
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
    puts "#{students[n][:name].center(15)} #{students[n][:country]} (cohort: #{students[n][:cohort]})"
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
