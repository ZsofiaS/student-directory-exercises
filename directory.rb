@students = []

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:country], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, country, cohort = line.chomp.split(",")
    @students << {name: name, country: country, cohort: cohort.to_sym}
  end
  file.close
end

def try_load_students
  filename = ARGV.first
  return if filename.nil?
  if File.exist?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

def input_students
  puts "Please enter the names of the students"
  name = STDIN.gets[0...-1]
  while !name.empty? do
    puts "Please enter country of birth"
    country = STDIN.gets.chomp
    puts "Please enter cohort"
    puts "To finish, just hit return twice"
    cohort = STDIN.gets.chomp.to_sym
    if country.empty? 
    end
    if cohort.empty?
      cohort = "N/A"
    end
    @students << {name: name, country: country, cohort: cohort}
    @students.count == 1 ? studentWord = "student" : studentWord = "students"
    puts "Now we have #{@students.count} #{studentWord}"
    name = STDIN.gets.chomp
  end
end

def interactive_menu
  try_load_students
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def print_menu
    puts "1. Input the students"
    puts "2. Show the students"
    puts "3. Save the list to students.csv"
    puts "4. Load the list from students.csv"
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
    when "3"
      save_students
    when "4"
      load_students
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
  cohorts = [:january, :february, :march, :april, :may, :june, :july, :august, :september, :october, :november, :december]
  cohorts.map do |cohort|
    @students.each do |student|
      if student[:cohort] == cohort
        puts "#{student[:name].center(15)} #{student[:country]} (#{student[:cohort]} cohort)"
      end
    end
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

interactive_menu