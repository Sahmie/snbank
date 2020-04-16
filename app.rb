def authentication(user_name, pass_word)
  db_name = false;
  db_pword = false;
  File.open("staff.txt").readlines.each do |line|
    if line.split(":").first === "username"
      db_name = true if line.split.last === user_name;
    elsif line.split(":").first === "password"
      db_pword = true if line.split.last === pass_word;
    end
 end
   if (db_name && db_pword) == true
     p "yay"
   else
     p "nay"
   end
end

puts "****Welcome to startng bank ltd****"
puts "****Please select an option(select either 1 or 2)"

puts "1.Staff Login"
puts "2.Close App"

first_choice = gets.chomp.to_i
if first_choice == 1 
  puts "Enter your Login details please"
  puts "Username: "
  print "> "
  user_name = gets.chomp.to_s
  puts "Password: "
  print "> "
  pass_word = gets.chomp.to_s
  authentication(user_name, pass_word)
elsif()

end

