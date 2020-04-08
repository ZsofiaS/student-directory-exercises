require 'csv'
@students = []

def add_student(name, country, cohort)
  @students << {name: name, country: country, cohort: cohort} 
end

def ask_for_filename
  puts "Please enter filename (e.g. users.txt)"
  return filename = STDIN.gets.chomp 
end

def save_students(filename)
  if filename == ""
    output_file = "students.csv"
  else
    output_file = filename
  end
  CSV.open(output_file, "wb") do |csv|
    @students.each do |student|
      student_data = [student[:name], student[:country], student[:cohort]]
      csv << student_data
    end
  end
  puts "Student data has been saved."
end

def load_students(filename)
  @students = []
  if File.exist?(filename)
    input_file = filename
  else 
    input_file = "students.csv"
  end
  CSV.foreach(input_file) do |row|
    name, country, cohort = row
    add_student(name, country, cohort)
  end
  puts "Student data has been loaded from #{input_file}."
end

def try_load_students
  filename = ARGV.first
  filename = "students.csv" if filename.nil?
  if File.exist?(filename)
    load_students(filename)
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

def input_students
  puts "Please enter the names of the student"
  name = STDIN.gets[0...-1]
  while !name.empty? do
    puts "Please enter country of birth"
    country = STDIN.gets.chomp
    puts "Please enter cohort"
    puts "To finish, just hit return twice"
    cohort = STDIN.gets.chomp.to_sym
    country = "N/A" if country.empty? 
    cohort = "N/A" if cohort.empty?
    add_student(name, country, cohort)
    @students.count == 1 ? studentWord = "student" : studentWord = "students"
    puts "Now we have #{@students.count} #{studentWord}"
    name = STDIN.gets.chomp
  end
end

def load_interactive_menu
  try_load_students
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def print_menu
    puts "************************************"
    puts "Select an option:"
    puts "1. Input the students"
    puts "2. Show the students"
    puts "3. Save the list to CSV file"
    puts "4. Load the list from CSV file"
    puts "9. Exit"
    puts "************************************"
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
    when "3"
      save_students(ask_for_filename)
    when "4"
      load_students(ask_for_filename)
    when "9"
      puts "Bye!"
      exit
    else
      puts "I don't know what you meant, try again"
  end
end

def print_header
  puts "The students of Villains Academy"
  puts "--------------------------------"
end

def print_students_list
  @students.each do |student|
    puts "#{student[:name].center(15)} #{student[:country].center(15)} (cohort: #{student[:cohort]})"
  end
end

def print_footer
  puts "\nOverall, we have #{@students.count} great students"
end

load_interactive_menu