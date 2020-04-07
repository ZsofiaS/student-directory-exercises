def interactive_menu
  students = []
  loop do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"
    selection = gets.chomp
    case selection
      when "1"
        students = input_students
      when "2"
        if !students.empty? 
          print_header
          print(students)
          print_footer(students)
        else
          puts "We have no students currently."
        end
      when "9"
        exit
      else
        puts "I don't know what you meant, try again"
    end
  end
end

def input_students
  puts "Please enter the names of the students"
  students = []
  name = gets[0...-1]
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
    students.count == 1 ? studentWord = "student" : studentWord = "students"
    puts "Now we have #{students.count} #{studentWord}"
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

interactive_menu


