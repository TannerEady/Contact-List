#require 'csv'
require 'pg'

class Contact 

  # attr_accessor :name, :email

  # def initialize(name, email)
  #   # TODO: assign local variables to instance variables
  #   @name = name
  #   @email = email
  # end
  # def to_s
  #   # TODO: return string representation of Contact
  # end

  def save

    if @id
      columns = instance_variables_hash.keys.join(", ")
      values = instance_variables_hash.values.map { |v| "'#{v}" }.join(", ")
  end

  def destroy(id)

    DELETE FROM contacts WHERE id = id

  end
 
  ## Class Methods
  class << self

    def connection
      conn = PG.connect(
        host: 'localhost',
        dbname: 'contactlist',
        user: 'development',
        password: 'development'
      )
    end
 
    def new(firstname, lastname, email)

      INSERT INTO contacts (firstname, lastname, email)
      VALUES (firstname, lastname, email)
      # TODO: Will initialize a contact as well as add it to the list of contacts
      # contacts = []
      # contacts[0] = contacts.object_id
      # contacts[1] = name
      # contacts[2] = email

      # CSV.open("contacts.csv", "a") do |csv|
      #   csv << contacts
      # end
    end
 
    def find(id)

      SELECT c.id, c.firstname, c.lastname, c.email
      FROM contacts AS c
      WHERE c.id = id

    end

      # TODO: Will find and return contacts that contain the term in the first name, last name or email
      # index = false
      # File.open("contacts.csv", "r") do |file|
      #   file.readlines.each do |line|
      #     index = true if line.match(term.to_s)
      #     puts line if index == true
      #   end
      # end
      # index
    end

    def find_all_by_lastname(lastname)

      CONN.exec_params("SELECT * FROM #{contacts} WHERE lastname=#{lastname}")

    end

    def find_all_by_firstname(firstname)

      CONN.exec_params("SELECT * FROM #{contacts} WHERE firstname=#{firstname}")

    end

    def find_by_email(email)

      CONN.exec_params("SELECT * FROM #{contacts} WHERE email=#{email}")

    end
 
    # def list
    #   # TODO: Return the list of contacts, as is
    #  CSV.foreach('contacts.csv') do |row|
    #   puts row.inspect
    #   end
    # end
    
    # def show(id)
    #   # TODO: Show a contact, based on ID
    #   index = false
    #   File.open("contacts.csv", "r") do |file|
    #     file.readlines.each do |line|
    #       index = true if line.match(id.to_s)
    #       puts line if index == true
    #       index = false
    #   end
    # end
  end
    
  end
 
end


