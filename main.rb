require './app'

def list_options
  puts 'Please choose an option by entering a number:'
  puts '1 - List all books'
  puts '2 - List all people'
  puts '3 - Create a person'
  puts '4 - Create a book'
  puts '5 - Create a rental'
  puts '6 - List all rentals for a given person id'
  puts '7 - Exit'
end

def selection_cases
  cases = { 1 => :show_books,
            2 => :show_people,
            3 => :create_person,
            4 => :create_book,
            5 => :create_rental,
            6 => :rentals_person_id,
            7 => :quit }

  loop do
    list_options
    selection = gets.chomp.to_i
    method = cases[selection]
    if method == :quit
      puts 'Thanks for using this app'
      break
    end
    send(method)
  end
end

def main
  app = App.new
  app.start_app
end

main
