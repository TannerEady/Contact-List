require 'pg'

class Contact

  attr_reader :firstname, :lastname, :email

  def initialize(firstname, lastname, email)
    @firstname = firstname
    @lastname = lastname
    @email = email
  end

  def save
    contact = self.class.connection.exec_params(
      "INSERT INTO contacts(firstname, lastname, email)
      VALUES($1, $2, $3) returning id;", [@firstname, @lastname, @email])
      @id = contact[0][@id]
  end

  def destroy
    self.class.connection.exec_params("DELETE FROM contacts 
      WHERE id = $1;", [@id])
  end

  class << self

    def connection
        @@conn = PG.connect(
          host: 'localhost',
          dbname: 'contactlist',
          user: 'development',
          password: 'development'
        )
    end

    def see_all
      connection.exec('SELECT * FROM contacts;').each do |contact|
        puts contact
      end
    end

    def find(id)
      connection.exec_params('SELECT * FROM contacts WHERE
        id = $1;', [id]).each do |contact|
        puts contact
      end
    end

    def find_all_by_lastname(name)
      connection.exec_params('SELECT * FROM contacts WHERE
        lastname = $1;', [name]).each do |contact|
        puts contact
      end
    end

    def find_all_by_firstname(name)
      connection.exec_params('SELECT * FROM contacts WHERE
        firstname = $1;', [name]).each do |contact|
        puts contact
      end
    end

    def find_by_email(email)
      connection.exec_params('SELECT * FROM contacts WHERE
        email = $1;', [email]).each do |contact|
        puts contact
      end
    end

  end 

end
    
# Contact.new('Jordy', 'Atwood', 'jordy@mail.com').save
# Contact.find(3) 
# Contact.find_by_email('sue@mail.com')
# Contact.find_all_by_firstname('Aaron')
# Contact.find_all_by_lastname('Prier')
# Contact.see_all