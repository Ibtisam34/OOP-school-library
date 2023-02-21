require 'date'

require 'json'

# Load the data from the files

# Load the data from the files

books_data = File.read('books.json')

people_data = File.read('people.json')

rentals_data = File.read('rentals.json')

# Parse the JSON data into Ruby hashes

books = JSON.parse(books_data, symbolize_names: true)

people = JSON.parse(people_data, symbolize_names: true)

rentals = JSON.parse(rentals_data, symbolize_names: true)

# Display the data in the terminal

puts 'Books:'

books.each do |book|
  puts "Title: #{book[:title]}"

  puts "Author: #{book[:author]}"

  puts "Rentals: #{book[:rentals].size}"

  puts
end

puts 'People:'

people.each do |person|
  puts "Name: #{person[:name]}"

  puts "Age: #{person[:age]}"

  puts "Parent Permission: #{person[:parent_permission]}"

  puts "Rentals: #{person[:rentals].size}"

  puts
end

puts 'Rentals:'

rentals.each do |rental|
  puts "Book: #{rental[:book][:title]}, Author: #{rental[:book][:author]}"

  puts "Person: #{rental[:person][:name]}, Age: #{rental[:person][:age]}"

  puts "Rental Date: #{rental[:date]}"

  puts '---'
end
