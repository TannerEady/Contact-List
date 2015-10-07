require_relative 'contact'
require_relative 'contact_database'

class ContactList

#@user_input = ARGV


# TODO: Implement command line interaction
# This should be the only file where you use puts and gets
if ARGV[0]
  command = ARGV[0]
else
  print "Please enter a command: "
  command = gets.chomp.downcase
end
 case command 
 when 'help' then 
  puts "Here is a list of available commands:"
  puts "new - Create a new contact."
  puts "list - List all contacts."
  puts "show - Show a contact."
  puts "find - Find a contact."
  when 'new' then
    if Contact.find(ARGV[2])
     print "Contact already exists. Please try a different email address.\n"
    else
    Contact.create(ARGV[1], ARGV[2])
    puts "Your contact has been added!"
  end
  when 'list' then Contact.list
  when 'show' then 
    Contact.show(ARGV[1])
  when 'find' then 
    Contact.find(ARGV[1])
  end
end