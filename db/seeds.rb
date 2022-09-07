# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# ApplicationRecord.transaction do 
    puts "Destroying tables..."
    # Unnecessary if using `rails db:seed:replant`
    User.destroy_all
  
    puts "Resetting primary keys..."
    # For easy testing, so that after seeding, the first `User` has `id` of 1
    ApplicationRecord.connection.reset_pk_sequence!('users')
  
    puts "Creating users..."
    User.create!(
      first_name: 'Sunny', 
      last_name: 'Ly',
      email: 'sunny@mail.com', 
      password: 'password'
    )
  
    # More users
    # 10.times do 
    #   User.create!({
    #     firstName: Faker.name.firstName(),
    #     lastName: Faker.name.lastName(),
    #     email: Faker::Internet.unique.email,
    #     password: 'password'
    #   }) 
    # end
  
    puts "Done!"
  # end