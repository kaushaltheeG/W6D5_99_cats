# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


ApplicationRecord.transaction do
  # Destroy tables (not necessary if using `rails db:seed:replant`)
  puts 'Destroying tables...'
  Cat.destroy_all

  # Reset primary keys (i.e., ids)
  puts 'Resetting id sequences...'
  %w(cats).each do |table_name|
    ApplicationRecord.connection.reset_pk_sequence!(table_name)
  end

  # Create seed data
  puts 'Creating seed data...'

  c1 = Cat.create!(birth_date: '2010/10/10', color: 'white', name: 'mittens', sex: 'M', description: "a cat w/ mittens")
  c2 = Cat.create!(birth_date: '2008/11/11', color: 'grey', name: 'boots', sex: 'M', description: "a cat w/ boots")
  c3 = Cat.create!(birth_date: '2015/12/12', color: 'black', name: 'snuggy face', sex: 'M', description: "a snuggy cat")

  puts 'Done!'
end

