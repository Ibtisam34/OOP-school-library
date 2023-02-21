require 'json'
# Load data from files or create new empty data if files are missing or empty
books = if File.exist?('books.json') && !File.zero?('books.json')
          JSON.parse(File.read('books.json'), symbolize_names: true)
        else
          []
        end
people = if File.exist?('people.json') && !File.zero?('people.json')
           JSON.parse(File.read('people.json'), symbolize_names: true)
         else
           []
         end
rentals = if File.exist?('rentals.json') && !File.zero?('rentals.json')
            JSON.parse(File.read('rentals.json'), symbolize_names: true)
          else
            []
          end
begin
  # Add rental information to the corresponding books and people objects
  rentals.each do |rental|
    book = books.find { |b| b[:id] == rental[:book_id] }
    person = people.find { |p| p[:id] == rental[:person_id] }
    book[:rentals] << rental if book
    person[:rentals] << rental if person
  end
  # Display the data
  puts 'Books:'
  books.each do |book|
    puts "Title: #{book[:title]}"
    puts "Author: #{book[:author]}"
    puts "Rentals: #{book[:rentals].size}"
    puts '------------------------'
  end
  puts 'People:'
  people.each do |person|
    puts "Name: #{person[:name]}"
    puts "Age: #{person[:age]}"
    puts "Parent Permission: #{person[:parent_permission]}"
    puts "Rentals: #{person[:rentals].size}"
    puts '------------------------'
  end
rescue StandardError => e
  puts "An error occurred: #{e.message}"
end
at_exit do
  # Save data to files
  File.write('books.json', JSON.pretty_generate(books))
  File.write('people.json', JSON.pretty_generate(people))
  File.write('rentals.json', JSON.pretty_generate(rentals))
end
