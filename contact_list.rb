require_relative 'contact'
require_relative 'contact_database'

class ContactList
# TODO: Implement command line interaction
# This should be the only file where you use puts and gets

def main_menu(command)
  print "Please enter a command: "
  command = gets.chomp.downcase
   case command 
   when 'help' then 
    puts "Here is a list of available commands:"
    puts "new - Create a new contact."
    puts "list - List all contacts."
    puts "show - Show a contact."
    puts "find - Find a contact."
  when 'new' then
    prints "Please enter contact name: "
    name = gets.chomp
    prints "Please enter contact email address: "
    email = gets.chomp
    Contact.create(name, email)
  when 'list' then Contact.list
  when 'show' then Contact.show
  when 'find' then Contact.find
  end
end
end


