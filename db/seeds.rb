# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'open-uri'

ApplicationRecord.transaction do 
    puts "Destroying tables..."
    # Unnecessary if using `rails db:seed:replant`
    User.destroy_all
  
    puts "Resetting primary keys..."
    # For easy testing, so that after seeding, the first `User` has `id` of 1
    ApplicationRecord.connection.reset_pk_sequence!('users')
    ApplicationRecord.connection.reset_pk_sequence!('products')
  
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

    #SKIN CARE PRODUCTS --------------
    product_img6 = Product.create!({
      name: "A-Gloei Maretinol Oil", 
      category: "SKIN CARE", 
      price: 72.00,
      desc:"A gentle dose of retinol clarifies, refines, and smooths uneven, blemished, textured, or aging skin. It also evens out tone, reducing discoloration and boosting skin’s natural glow, while ceramides replenish the skin barrier and improve elasticity. Antioxidant- and omega-rich virgin marula oil (which makes up 95% of the formula!) replenishes essential moisture and reduces the appearance of redness, bringing skin back to its healthiest, most youthful state."
    })
    file6 = URI.open('https://funelephant-seed.s3.us-west-1.amazonaws.com/A-Gloei_Angled_Product_Shot.png')
    product_img6.photo.attach(io: file6, filename: 'A-Gloei_Angled_Product_Shot.png')
    #---------------
    product_img13 = Product.create!({
      name: "A-Gloei Maretinol oil Midi", 
      category: "SKIN CARE", 
      price: 40.00,
      desc:"A gentle dose of retinol clarifies, refines, and smooths uneven, blemished, textured, or aging skin. It also evens out tone, reducing discoloration and boosting skin’s natural glow, while ceramides replenish the skin barrier and improve elasticity. Antioxidant- and omega-rich virgin marula oil (which makes up 95% of the formula!) replenishes essential moisture and reduces the appearance of redness, bringing skin back to its healthiest, most youthful state."
    })
    file13 = URI.open('https://funelephant-seed.s3.us-west-1.amazonaws.com/A_GloeiMidi_AngledShot.png')
    product_img13.photo.attach(io: file13, filename: 'A_GloeiMidi_AngledShot.png')
    #---------------
    product_img4 = Product.create!({
      name: "Anytime Anyface", 
      category: "SKIN CARE", 
      price: 28.00,
      desc:"Protini™ Serum improves the appearance of skin’s texture, tone, radiance, and bounce, while Protini™ Cream moisturizes and replenishes to restore your skin to a strong, healthy state."
    })
    file4 = URI.open('https://funelephant-seed.s3.us-west-1.amazonaws.com/anytime_anyface.png')
    product_img4.photo.attach(io: file4, filename: 'anytime_anyface.png')

    #---------------
    product_img9 = Product.create!({
      name: "A-Passioni Retinol Cream", 
      category: "SKIN CARE", 
      price: 28.00,
      desc:"Retinol and supportive peptides restore bounce, resilience, and a brighter clarity to skin while helping to even skin tone and texture—without the associated redness and irritation. Vitamin F and a blend of comforting passionfruit, apricot, marula, and jojoba oils replenish essential lipids and moisture, while antioxidant-packed kale, winter cherry, and xanthophylls help defend against environmental stressors. It’s like a reboot of your skin back to its healthiest, most youthful state."
    })
    file9 = URI.open('https://funelephant-seed.s3.us-west-1.amazonaws.com/APassioni_AngledProductShot.png')
    product_img9.photo.attach(io: file9, filename: 'APassioni_AngledProductShot.png')


  end