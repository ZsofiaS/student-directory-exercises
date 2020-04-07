@students = []

def input_students
  puts "Please enter the names of the students"
  name = gets[0...-1]
  while !name.empty? do
    puts "Please enter country of birth"
    country = gets.chomp
    puts "Please enter cohort"
    puts "To finish, just hit return twice"
    cohort = gets.chomp.to_s
    if country.empty? 
    end
    if cohort.empty?
      cohort = "N/A"
    end
    @students << {name: name, country: country, cohort: cohort}
    @students.count == 1 ? studentWord = "student" : studentWord = "students"
    puts "Now we have #{@students.count} #{studentWord}"
    name = gets.chomp
  end
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def print_menu
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"
end

def show_students
    print_header
    print_students_list
    print_footer
end 

def process(selection)
  case selection
    when "1"
      input_students
    when "2" 
      show_students
    when "9"
      exit
    else
      puts "I don't know what you meant, try again"
  end
end

def print_header
  puts "The students of Villains Academy".center(45)
  puts "-------------".center(45)
end

def print_students_list
  @students.each do |student|
    puts "#{student[:name].center(15)} #{student[:country]} (cohort: #{student[:cohort]})"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

interactive_menu