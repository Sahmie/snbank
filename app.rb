# # authenticate login details
# def authentication(user_name, pass_word)
#   db_name = false;
#   db_pword = false;
#   File.open("staff.txt").readlines.each do |line|
#     if line.split(":").first === "username"
#       db_name = true if line.split.last === user_name;
#     elsif line.split(":").first === "password"
#       db_pword = true if line.split.last === pass_word;
#     end
#  end
#    if (db_name && db_pword) == true
#      return true
#    else
#      return false
#    end
# end

# puts "****Welcome to startng bank ltd****"
# puts "****Please select an option(select either 1 or 2)"

# puts "1.Staff Login"
# puts "2.Close App"

# first_choice = gets.chomp.to_i
# if first_choice == 1 
#   puts "Enter your Login details please"
#   puts "Username: "
#   print "> "
#   user_name = gets.chomp.to_s
#   puts "Password: "
#   print "> "
#   pass_word = gets.chomp.to_s
#   #check if staff is saved in our staff.txt file
#   check_login = authentication(user_name, pass_word);
#   if check_login
# #save user session
#     File.open(user_name, 'w'){|file| file.puts user_name + "+" + pass_word}

#   elsif check_login == false
#     puts "Sorry, login failed! please try again"
#   end
# elsif first_choice == 2
#   puts "Goodbye!"
# end



def bank_hall()
  puts "Welcome, please select an option!"
  puts "1. Create new bank account"
  puts "2. Check Account details"
  puts "3. Logout"
  print "> "
  bank_hall_option = gets.chomp.to_i
  if bank_hall_option == 1
    dbase = File.open("customer.txt", 'a')
    puts "please provide the following details..."
    puts "Account name"
    print "> "
    account_name = gets.chomp
    dbase.puts account_name;
    puts "Opening balance"
    print "> "
    opening_balance = gets.chomp
    dbase.puts opening_balance;
    puts "Account type(savings or current)"
    print "> "
    account_type = gets.chomp
    dbase.puts account_type;
    puts "Account email"
    print "> "
    account_email = gets.chomp
    dbase.puts account_email;
    account_number = rand(10000000000)
    dbase.puts account_number;
    dbase.close;
    puts account_number;

  end
end

bank_hall()