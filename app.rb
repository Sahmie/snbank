# authenticate login details
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
     return true
   else
     return false
   end
end



######banking hall function
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
    puts "Account name(please no spaces, separate with underscore)"
    print "> "
    account_name = gets.chomp
    dbase.puts account_name;
    puts "Opening balance(please no spaces, separate with underscore)"
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
    puts "Your new account number is : #{account_number}";
    bank_hall();
  elsif bank_hall_option == 2
    puts "Please enter your account number"
    print "> "
    user_acct_input = gets.chomp
    account_num_in_db = 0;
    found = false;
    contents = File.open("customer.txt", "r"){ |file| file.read }
    customer_txt = contents.split(' ');
    customer_txt.each_with_index do |item, index|
      if (item == user_acct_input)
         account_num_in_db += index;
         found = true;
      end
    end
    if found
      puts "Your account details are...."
      puts "Account Name: #{customer_txt[account_num_in_db - 4]}"
      puts "Opening Balance: #{customer_txt[account_num_in_db - 3]}"
      puts "Account type: #{customer_txt[account_num_in_db - 2]}"
      puts "Account email: #{customer_txt[account_num_in_db - 1]}"
      puts "Account Number: #{customer_txt[account_num_in_db]}"
    else
    puts "Sorry, Invalid account details"
    end
    bank_hall()
  else
    #delete user session file 
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
  #check if staff is saved in our staff.txt file
  check_login = authentication(user_name, pass_word);
  if check_login
#save user session
    File.open("#{user_name}.txt", 'w'){|file| file.puts user_name + "+" + pass_word}
    bank_hall();
  elsif check_login == false
    puts "Sorry, login failed! please try again"
  end
elsif first_choice == 2
  puts "Goodbye!"
end
