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
    Review.destroy_all
    Product.destroy_all
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

    User.create!(
      first_name: 'Darren', 
      last_name: 'Eid',
      email: 'darreneidDOTA@gmail.com', 
      password: 'imtoosmartFormyOwnGood1'
    )
  
    User.create!(
      first_name: 'Zuzu', 
      last_name: 'Chaoi',
      email: 'zuzuchaoi@gmail.com', 
      password: 'chocolatelover123!'
    )
  
    User.create!(
      first_name: 'sdfdsfs', 
      last_name: 'Lsdfdsfy',
      email: 'sunsdfdsfdsfny@mail.com', 
      password: 'padsfsdfdfsssword'
    )
  
    User.create!(
      first_name: 'Ssdfdsfsdunny', 
      last_name: 'Ldsfsdfdsfy',
      email: 'sunsdfdsfdsfsfny@mail.com', 
      password: 'psdfdsfdassword'
    )
  
    User.create!(
      first_name: 'Susdfsadfsdfnny', 
      last_name: 'Lsafsfdfsy',
      email: 'sudsfdsfsdfnny@mail.com', 
      password: 'psdfsdfdsfdsfassword'
    )
  
    User.create!(
      first_name: 'Susdfsdfdsffdfnny', 
      last_name: 'sdfdsffsdLy',
      email: 'sdfsdfdsfdsfsfsdsunny@mail.com', 
      password: 'sdfasdfdsfsdpassword'
    )
  
    User.create!(
      first_name: 'Ssdfdsfdfdfsadfunny', 
      last_name: 'sdfsafsfasdfLy',
      email: 'sunnsdfdsafsdfy@mail.com', 
      password: 'pasdfasfdsfdsfssword'
    )
  
    User.create!(
      first_name: 'Ssafdsfsdfasfdsunny', 
      last_name: 'sdfsdfewrwsLy',
      email: 'sunadfdsfdfafny@mail.com', 
      password: 'psdafdsfafdsassword'
    )
  
    User.create!(
      first_name: 'Su234324sdf234rwnny', 
      last_name: 'sdfdsafsfdsafLy',
      email: 'sunndsfsfasfdsfy@mail.com', 
      password: 'pasdfdsfsdfdfasdfsdassword'
    )

    User.create!(
      first_name: 'sadfsdfdsf', 
      last_name: 'sdfdsafsdfsdfdfsfdsafLy',
      email: 'sunndsfsfasdfdssfdsfy@mail.com', 
      password: 'pasdfdsdfsfdfssfsdfdfasdfsdassword'
    )

    User.create!(
      first_name: 'Su234324sdf234rwnny213', 
      last_name: 'sdfdsafsfdsafLy213',
      email: 'sunndsfsfasfdsfy@mail.com231', 
      password: 'pasdfdsfsdfdfasdfsdassword23'
    )
  

  
    10.times do 
      User.create!({
        first_name: Faker::Name.first_name(),
        last_name: Faker::Name.last_name(),
        email: Faker::Internet.unique.email,
        password: 'password132!'
      }) 
    end
  
    
    puts "Done!"

    #SKIN CARE PRODUCTS --------------

    product_img1 = Product.create!({
      name: "The Littles 6.0", 
      category: "SKIN CARE", 
      price: 74.00,
      desc:"Using them is simple; pick products for your a.m. and p.m. routine based on what your skin needs—that changes every day."
    })
    file1 = URI.open('https://funelephant-seed.s3.us-west-1.amazonaws.com/the_littles.png')
    product_img1.photo.attach(io: file1, filename: 'the_littles.png')
    #---------------
    product_img2 = Product.create!({
      name: "T.L.C. Sukari Babyfacial", 
      category: "SKIN CARE", 
      price: 80.00,
      desc:"This next-generation mask is an at-home “facial” that effectively yet gently exfoliates the pore lining and resurfaces by getting rid of built-up dead skin cells. With a whopping 25% AHA / 2% BHA blend of our dream team glycolic, tartaric, lactic, citric, and salicylic acids, this pro-quality formula dramatically smooths texture while minimizing the look of pores, fine lines, and wrinkles. Uniquely formulated with chickpea flour, pumpkin ferment, and a soothing antioxidant blend of matcha tea, milk thistle, and apple, Babyfacial™ delivers incredible brightening and enzymatic action, improves skin’s elastic feel, and reveals the look of a more even, radiant, baby-soft complexion. Think of it as an extra nudge for stubborn dull skin."
    })
    file2 = URI.open('https://funelephant-seed.s3.us-west-1.amazonaws.com/Babyfacial_AngledProductShot.png')
    product_img2.photo.attach(io: file2, filename: 'Babyfacial_AngledProductShot.png')
    #--------------
    product_img3 = Product.create!({
      name: "Beste No 9 Jelly Cleanser", 
      category: "SKIN CARE", 
      price: 16.00,
      desc:"With a unique blend of mild surfactants and makeup-dissolving emollients, this gentle formula rinses away without an ounce of residue, leaving skin clean and soft."
    })
    file3 = URI.open('https://funelephant-seed.s3.us-west-1.amazonaws.com/Beste_Cleanser_Angled_Shot.png')
    product_img3.photo.attach(io: file3, filename: 'Beste_Cleanser_Angled_Shot.png')
    #--------------
    product_img4 = Product.create!({
      name: "Anytime Anyface", 
      category: "SKIN CARE", 
      price: 28.00,
      desc:"Protini™ Serum improves the appearance of skin’s texture, tone, radiance, and bounce, while Protini™ Cream moisturizes and replenishes to restore your skin to a strong, healthy state."
    })
    file4 = URI.open('https://funelephant-seed.s3.us-west-1.amazonaws.com/anytime_anyface.png')
    product_img4.photo.attach(io: file4, filename: 'anytime_anyface.png')
    #--------------

    product_img5 = Product.create!({
      name: "B-Hydra Intensive Hydration Serum", 
      category: "SKIN CARE", 
      price: 48.00,
      desc:"Formulated with pro-vitamin B5 and pineapple ceramide, B-Hydra™ delivers steady hydration throughout the day, leaving the skin looking healthy and more illuminated. Blended with a unique lentil-apple-and-watermelon complex, B-Hydra™ helps diminish drabness, dryness, and the appearance of fine lines. Your complexion will appear brighter and more youthful upon every application."
    })
    file5 = URI.open('https://funelephant-seed.s3.us-west-1.amazonaws.com/BHydra_AngledShot.png')
    product_img5.photo.attach(io: file5, filename: 'BHydra_AngledShot.png')
    #---------------
    product_img6 = Product.create!({
      name: "A-Gloei Maretinol Oil", 
      category: "SKIN CARE", 
      price: 72.00,
      desc:"A gentle dose of retinol clarifies, refines, and smooths uneven, blemished, textured, or aging skin. It also evens out tone, reducing discoloration and boosting skin’s natural glow, while ceramides replenish the skin barrier and improve elasticity. Antioxidant- and omega-rich virgin marula oil (which makes up 95% of the formula!) replenishes essential moisture and reduces the appearance of redness, bringing skin back to its healthiest, most youthful state."
    })
    file6 = URI.open('https://funelephant-seed.s3.us-west-1.amazonaws.com/A-Gloei_Angled_Product_Shot.png')
    product_img6.photo.attach(io: file6, filename: 'A-Gloei_Angled_Product_Shot.png')
    #--------------
    product_img7 = Product.create!({
      name: "C-Tango™ Multivitamin Eye Cream", 
      category: "SKIN CARE", 
      price: 64.00,
      desc:"C-Tango™ is a dance of potent antioxidants, replenishing ceramides and plant oils, and soothing actives, all designed to refresh skin and restore a radiant appearance. Gentle enough for a.m. and p.m. use and powerful enough to improve even stubborn signs of damage."
    })
    file7 = URI.open('https://funelephant-seed.s3.us-west-1.amazonaws.com/C-Tango-Angled-Shot.png')
    product_img7.photo.attach(io: file7, filename: 'C-Tango-Angled-Shot.png')
    #--------------
    product_img8 = Product.create!({
      name: "Call It a Night Duo", 
      category: "SKIN CARE", 
      price: 28.00,
      desc:"This multifaceted rescue cream provides replenishing barrier support by reinforcing skin’s acid mantle and defending against the effects of everyday stressors."
    })
    file8 = URI.open('https://funelephant-seed.s3.us-west-1.amazonaws.com/Call_It_A_Night_Angled_Shot.png')
    product_img8.photo.attach(io: file8, filename: 'Call_It_A_Night_Angled_Shot.png')
    #---------------
    product_img9 = Product.create!({
      name: "A-Passioni™ Retinol Cream", 
      category: "SKIN CARE", 
      price: 28.00,
      desc:"Retinol and supportive peptides restore bounce, resilience, and a brighter clarity to skin while helping to even skin tone and texture—without the associated redness and irritation. Vitamin F and a blend of comforting passionfruit, apricot, marula, and jojoba oils replenish essential lipids and moisture, while antioxidant-packed kale, winter cherry, and xanthophylls help defend against environmental stressors. It’s like a reboot of your skin back to its healthiest, most youthful state."
    })
    file9 = URI.open('https://funelephant-seed.s3.us-west-1.amazonaws.com/APassioni_AngledProductShot.png')
    product_img9.photo.attach(io: file9, filename: 'APassioni_AngledProductShot.png')
    #---------------
    product_img10 = Product.create!({
      name: "Ceramighty™ AF Eye Balm", 
      category: "SKIN CARE", 
      price: 60.00,
      desc:"Loaded with ceramides, vitamin F, and omega-rich plant oils and butters, Ceramighty™ AF Eye Balm deeply nourishes and strengthens the skin barrier, restoring and preserving elasticity while delivering intense, long-lasting moisture. Soothing Avena sativa (oat) extract helps to calm skin and relieve the appearance of fatigue around the eye area."
    })
    file10 = URI.open('https://funelephant-seed.s3.us-west-1.amazonaws.com/Ceramighty.png')
    product_img10.photo.attach(io: file10, filename: 'Ceramighty.png') 
    #---------------
    product_img11 = Product.create!({
      name: "C-Firma™ Fresh Day Serum", 
      category: "SKIN CARE", 
      price: 78.00,
      desc:"C-Firma™ Fresh Day Serum is designed to be mixed by you before its first use, which maximizes the potency of its delicate (but powerful) ingredients while keeping the formula fresh. This revolutionary vitamin C serum is packed with a powerful antioxidant complex of 15% l-ascorbic acid, 0.5% ferulic acid, and 1% vitamin E to reveal a brighter, firmer, and more even-looking complexion. Potently formulated with pumpkin ferment extract and sodium hyaluronate crosspolymer, C-Firma™ helps to enzymatically dissolve surface dead skin cells as it hydrates and soothes. The result is a noticeably diminished appearance of signs of aging and photodamage—replaced by incredible radiance and luminosity."
    })
    file11 = URI.open('https://funelephant-seed.s3.us-west-1.amazonaws.com/CFirmaFresh_Angled_.png')
    product_img11.photo.attach(io: file11, filename: 'CFirmaFresh_Angled_.png')
    #---------------
    product_img12 = Product.create!({
      name: "D-Bronzi™ Anti-Pollution Sunshine Drops", 
      category: "SKIN CARE", 
      price: 36.00,
      desc:"Like sunshine in a bottle without the damaging effects. Omega-rich virgin marula and black currant seed oils, along with vitamin F (fatty acids), immediately replenish the delicate balance that supports a healthy barrier function, while a concentrated mix of protective antioxidants boosts skin’s defenses against pollution and environmental stressors—all delivered with a bronzy finish."
    })
    file12 = URI.open('https://funelephant-seed.s3.us-west-1.amazonaws.com/D-Bronzi_Angled_Shot.png')
    product_img12.photo.attach(io: file12, filename: 'D-Bronzi_Angled_Shot.png') 
    #---------------
    product_img13 = Product.create!({
      name: "E-Rase™ Milki Micellar Water", 
      category: "SKIN CARE", 
      price: 28.00,
      desc:"Made with ultra-mild micelles, soothing vitamin E, replenishing fatty acids, and antioxidant-rich, nonfragrant plant oils (marula, baobab, mongongo, wild melon seed, ximenia seed, passionfruit, and sweet almond), E-Rase™ nourishes skin while dissolving and lifting away makeup and dirt, is barrier-supportive, and may be used anytime you need a quick skin refreshment."
    })
    file13 = URI.open('https://funelephant-seed.s3.us-west-1.amazonaws.com/E-Rase_Angled_Shot.png')
    product_img13.photo.attach(io: file13, filename: 'E-Rase_Angled_Shot.png')
    #---------------
    product_img14 = Product.create!({
      name: "It's Summer Somewhere ($39 value)", 
      category: "SKIN CARE", 
      price: 30.00,
      desc:"O-Bloos™ gives a golden peachy-pink wash of color while keeping skin soft and soothed; D-Bronzi™ supports a healthy barrier function and delivers a bronzy finish; Lala Retro™ provides barrier support by reinforcing skin’s acid mantle and defending against the effects of everyday stressors."
    })
    file14 = URI.open('https://funelephant-seed.s3.us-west-1.amazonaws.com/its_summer_somewhere.png')
    product_img14.photo.attach(io: file14, filename: 'its_summer_somewhere.png') 
    #---------------
    product_img15 = Product.create!({
      name: "Juju Bar", 
      category: "SKIN CARE", 
      price: 28.00,
      desc:"This multitasking bar is designed to effectively cleanse while gently removing dead skin cells from the surface of the skin. Infused with a blend of thermal mud, marula, bamboo, and superfruit, this unique formulation creates a creamy lather that dissolves excess oil, pore-clogging surface debris, and impurities while gently exfoliating dead skin cells. Skin feels softer and smoother with improved clarity."
    })
    file15 = URI.open('https://funelephant-seed.s3.us-west-1.amazonaws.com/Juju_Bar_Angled_Shot.png')
    product_img15.photo.attach(io: file15, filename: 'Juju_Bar_Angled_Shot.png') 
    #---------------
    product_img16 = Product.create!({
      name: "Lala Retro™ Whipped Cream", 
      category: "SKIN CARE", 
      price: 60.00,
      desc:"Lala Retro™ is a whipped dream-come-true for tired, dry skin. This  multifaceted rescue cream, infused with six African oils and a plant ceramide complex, provides replenishing barrier support by reinforcing skin’s acid mantle and defending against the effects of everyday stressors. Sodium hyaluronate crosspolymer easily soaks in to release intense hydration. In addition, antioxidant-rich fermented green tea helps combat signs of aging. Loaded with omega acids, Lala helps skin retain long-lasting moisture, forming a protective layer that allows skin to function at its optimal level."
    })
    file16 = URI.open('https://funelephant-seed.s3.us-west-1.amazonaws.com/Lala_Angled_Shot.png')
    product_img16.photo.attach(io: file16, filename: 'Lala_Angled_Shot.png') 
    #---------------
    product_img17 = Product.create!({
      name: "Lippe Balm", 
      category: "SKIN CARE", 
      price: 18.00,
      desc:"Spiked with an antioxidant-rich blend of avocado and mongongo nut oils, plus a tripeptide and sea fern algae, Lippe gives lips a plump look and a better-defined lip line. This buttery, luxurious balm softens and plumps the look of rough, parched lips, keeping them in lip-top condition."
    })
    file17 = URI.open('https://funelephant-seed.s3.us-west-1.amazonaws.com/Lippe_Balm_Angled_Shot.png')
    product_img17.photo.attach(io: file17, filename: 'Lippe_Balm_Angled_Shot.png') 
    #---------------
    product_img18 = Product.create!({
      name: "Littles Night Out ($70)", 
      category: "SKIN CARE", 
      price: 50.00,
      desc:"Beste™ No. 9 removes all traces of makeup and grime, T.L.C. Framboos™ visibly resurfaces dull, congested skin, B-Hydra™ replenishes thirsty skin, and Protini™ improves the look of skin’s tone, texture, and firmness."
    })
    file18 = URI.open('https://funelephant-seed.s3.us-west-1.amazonaws.com/Call_It_A_Night_Angled_Shot.png')
    product_img18.photo.attach(io: file18, filename: 'Call_It_A_Night_Angled_Shot.png.png') 
    #---------------
    product_img19 = Product.create!({
      name: "O-Bloos™ Rosi Drops", 
      category: "SKIN CARE", 
      price: 36.00,
      desc:"O-Bloos™ (the O stands for omegas) gives skin that flattering “nobody knows why you’re flushed” flush. The foolproof, watercolor-light formula is buildable and flatters most skin, and it’s delivered in concentrated drops that can be mixed into your other Drunk Elephant products."
    })
    file19 = URI.open('https://funelephant-seed.s3.us-west-1.amazonaws.com/O-Bloos_Angled_Shot_new.png')
    product_img19.photo.attach(io: file19, filename: 'O-Bloos_Angled_Shot_new.png') 
    #---------------
    product_img20 = Product.create!({
      name: "Pekee Bar™", 
      category: "SKIN CARE", 
      price: 28.00,
      desc:"Infused with a blend of blueberry extract, marula oil, and honey, Pekee Bar™ tones and promotes moisture retention for skin that feels firmer and more elastic. Pekee Bar™ is totally fragrance- and soap-free and formulated with only skin-friendly ingredients designed to cleanse and calm the skin."
    })
    file20 = URI.open('https://funelephant-seed.s3.us-west-1.amazonaws.com/Pekee_Bar_Angled_Shot.png')
    product_img20.photo.attach(io: file20, filename: 'Pekee_Bar_Angled_Shot.png') 
    #---------------
    product_img21 = Product.create!({
      name: "Protini™ Polypeptide Cream", 
      category: "SKIN CARE", 
      price: 22.00,
      desc:"Protini’s proprietary formula restores younger, revived-looking skin, almost from the first application. Lines, wrinkles, and signs of sun damage appear reduced, and skin feels strengthened and moisturized."
    })
    file21 = URI.open('https://funelephant-seed.s3.us-west-1.amazonaws.com/Protini_Angled_Shot.png')
    product_img21.photo.attach(io: file21, filename: 'Protini_Angled_Shot.png') 
    #---------------
    product_img22 = Product.create!({
      name: "F-Balm™ Electrolyte Waterfacial Midi", 
      category: "SKIN CARE", 
      price: 18.00,
      desc:"With a blend of barrier-replenishing ingredients, including niacinamide, sodium PCA, plant squalane, five forms of ceramides, omega fatty acids, and powerful antioxidants, F-Balm™ effectively rehydrates hungover, overly parched skin, making it soft and supple. Tiny beads loaded with vitamin F burst during application to deliver extra emollience and soothing hydration."
    })
    file22 = URI.open('https://funelephant-seed.s3.us-west-1.amazonaws.com/FBalm_AngledProduct.png')
    product_img22.photo.attach(io: file22, filename: 'FBalm_AngledProduct.png') 
    #---------------
    product_img23 = Product.create!({
      name: "Protini™ Powerpeptide Resurf Serum", 
      category: "SKIN CARE", 
      price: 82.00,
      desc:"With its ultra-concentrated blend of 11 peptides, Protini™ Powerpeptide Resurf Serum delivers plump, bouncy skin while targeting a dull, uneven complexion. The appearance of fine lines, sun damage, and enlarged pores is improved and glow is restored, while powerful water-boosting ingredients (such as snow mushroom extract, sodium hyaluronate, and sodium PCA) replenish hydration levels. Antioxidant-rich, nonfragrant plant oils and vitamins (tocotrienols, squalane, green tea seed oil, and marula oil) soothe while adding a touch of lightweight moisture to skin."
    })
    file23 = URI.open('https://funelephant-seed.s3.us-west-1.amazonaws.com/ProtiniSerum_AngledProductShot.png')
    product_img23.photo.attach(io: file23, filename: 'ProtiniSerum_AngledProductShot.png') 
    #---------------
    product_img24 = Product.create!({
      name: "Shaba Complex™ Eye Serum", 
      category: "SKIN CARE", 
      price: 60.00,
      desc:"Shaba Complex™ Eye Serum contains potent doses of black tea ferment, niacinamide, copper peptides, and edelweiss stem cells, which work together to support a smoother, younger look around the eyes. With a unique combination of edelweiss stem cells and niacinamide, Shaba Complex™ helps diminish the appearance of fine lines and wrinkles. The powerful antioxidants in Co-Q10 help prevent premature signs of aging from environmental aggressors while also helping to fade age spots."
    })
    file24 = URI.open('https://funelephant-seed.s3.us-west-1.amazonaws.com/Shaba_AngledShot.png')
    product_img24.photo.attach(io: file24, filename: 'Shaba_AngledShot.png') 
    #---------------
    product_img25 = Product.create!({
      name: "Slaai™ Makeup-Melting Butter Cleanser", 
      category: "SKIN CARE", 
      price: 34.00,
      desc:"Skin-compatible Slaai™ effortlessly removes even water-resistant formulations and is free of PEGs and essential oils. Formulated with antioxidant-rich fruit extracts and oils to help soothe, plus a nourishing African oil blend of marula, baobab, kalahari melon, mongongo, and ximenia, Slaai™ Makeup-Melting Butter Cleanser cleanses and moisturizes without any irritants or sensitizers. Designed to be used on dry skin, Slaai™ removes excess oil, grime, and makeup from skin. Adding water activates Slaai™, transforming it into a milk that rinses cleanly, leaving behind a dewy glow."
    })
    file25 = URI.open('https://funelephant-seed.s3.us-west-1.amazonaws.com/Slaai_Angled_Shot.png')
    product_img25.photo.attach(io: file25, filename: 'Slaai_Angled_Shot.png') 
    #---------------
    product_img26 = Product.create!({
      name: "Sweet Biome™ Fermented Sake Spray", 
      category: "SKIN CARE", 
      price: 42.00,
      desc:"Sweet Biome’s cocktail of fermented sake extract, kombucha, and hops supplies skin with nutrient-dense substances that restore, soothe, and contribute to a balanced and healthy acid mantle and microbiome. Powerful electrolytes—coconut water and sodium PCA— provide potent antioxidant protection and critical hydration while natural minerals zinc, copper, and calcium gluconate help reduce redness and promote healthy collagen production. Ceramides, vitamin F, and essential amino acids keep skin soft, flexible, and moisturized."
    })
    file26 = URI.open('https://funelephant-seed.s3.us-west-1.amazonaws.com/SweetBiome_AngledProduct.png')
    product_img26.photo.attach(io: file26, filename: 'SweetBiome_AngledProduct.png') 
    #---------------
    product_img27 = Product.create!({
      name: "T.L.C. Framboos™ Glycolic Night Serum", 
      category: "SKIN CARE", 
      price: 134.00,
      desc:"Formulated with our dream team of glycolic, tartaric, lactic, citric, and salicylic acids and blended with raspberry extract and horse chestnut, T.L.C. Framboos™ curbs excess oiliness as it reveals greater clarity and luminosity. It also enhances the performance of other products by clearing the way for maximum absorption. T.L.C. Framboos™ sinks in easily and delivers an effective level of chemical exfoliation without harsh side effects, like dryness or sensitization. Go from a drab complexion to an absolutely luminous one, practically overnight."
    })
    file27 = URI.open('https://funelephant-seed.s3.us-west-1.amazonaws.com/TLCFramboos_AngledShortfor.png')
    product_img27.photo.attach(io: file27, filename: 'TLCFramboos_AngledShortfor.png') 
    #---------------
    product_img28 = Product.create!({
      name: "Baby Juju Bar + Baby Pekee Bar™ Duo", 
      category: "SKIN CARE", 
      price: 22.00,
      desc:"Formulated at nonstripping pH levels, Juju Bar and Pekee Bar™ easily remove grime and makeup from the day and are appropriate for all skin."
    })
    file28 = URI.open('https://funelephant-seed.s3.us-west-1.amazonaws.com/Travel_Bar_Duo_Angled_Shot.png')
    product_img28.photo.attach(io: file28, filename: 'Travel_Bar_Duo_Angled_Shot.png') 
    #---------------
    product_img29 = Product.create!({
      name: "Umbra Tinte™ Physical Daily Defense SPF 30", 
      category: "SKIN CARE", 
      price: 36.00,
      desc:"This tinted daily sunscreen is loaded with potent antioxidants, like astaxanthin, grape juice, and sunflower shoot extract, to minimize the appearance of photoaging for a more youthful-looking complexion. Infused with raspberry seed and marula oils, Umbra Tinte™ delivers essential moisture and helps minimize the look of fine lines and wrinkles for skin that appears healthy and preserved. This unique formulation is ideal for daily use without any residue or greasiness, and has a universally flattering tint for all skin tones. Umbra Tinte™ is suitable for all skin, including the most sensitive."
    })
    file29 = URI.open('https://funelephant-seed.s3.us-west-1.amazonaws.com/Umbra_Sheer_Angled_Shot.png')
    product_img29.photo.attach(io: file29, filename: 'Umbra_Sheer_Angled_Shot.png') 
    #---------------
    product_img30 = Product.create!({
      name: "Umbra Sheer™ Physical Daily Defense SPF 30", 
      category: "SKIN CARE", 
      price: 34.00,
      desc:"Umbra Sheer™ is a daily sunscreen loaded with potent antioxidants, like astaxanthin, grape juice, and sunflower shoot extract, to minimize the appearance of photoaging for a more youthful-looking complexion. Infused with raspberry seed and marula oils, Umbra Sheer™ delivers essential moisture and minimizes the look of fine lines and wrinkles for skin that appears healthy and preserved."
    })
    file30 = URI.open('https://funelephant-seed.s3.us-west-1.amazonaws.com/Umbra_Tinte_Angled_Shot.png')
    product_img30.photo.attach(io: file30, filename: 'Umbra_Tinte_Angled_Shot.png') 
  #---------------
    product_img31 = Product.create!({
      name: "Virgin Marula Luxury Facial Oil", 
      category: "SKIN CARE", 
      price: 68.00,
      desc:"Straight from the pip of the marula fruit, our pure, unrefined oil is virtually untouched by any chemical or fragrance, natural or synthetic. This super-absorbable oil will quickly sink in and diminish the look of fine lines and wrinkles. Appropriate for all skin, including the most sensitive. Our marula oil contains greater concentrations of polyphenols than dark chocolate or green or black teas, which means a powerful antioxidant defense against pollution and damaging environmental free radicals."
    })
    file31 = URI.open('https://funelephant-seed.s3.us-west-1.amazonaws.com/VMO_AngledProductShot.png')
    product_img31.photo.attach(io: file31, filename: 'VMO_AngledProductShot.png') 
  #---------------
    product_img32 = Product.create!({
      name: "Wonderwild™ Miracle Butter", 
      category: "SKIN CARE", 
      price: 38.00,
      desc:"Restorative plant butters—marula, cupuaçu, mango, and shea—help shield skin from environmental stressors, while antioxidant- and fatty-acid-rich plant oils (such as meadowfoam, pumpkin, green tea seed, kukui, and rose hip) replenish vital lipids to deeply nourish and strengthen a temporarily compromised skin barrier, bringing skin back to its healthiest state."
    })
    file32 = URI.open('https://funelephant-seed.s3.us-west-1.amazonaws.com/Wonderwild_AngledProductShot.png')
    product_img32.photo.attach(io: file32, filename: 'Wonderwild_AngledProductShot.png') 


  #-----------------
  Review.create!(
    title: 'love it!', 
    body: 'I’m so incredible happy with my purchase! I have completely fallen in love with everything Fun Elephant. I have noticed such such a positive change in my skin.',
    rating: 5, 
    user_id: 1,
    product_id: 1,
  )

  Review.create!(
    title: 'fewer products than prior The Littles', 
    body: 'I paid less than $50 for Littles 4.0 and received more items than is included in the current Littles Kit. very disappointing....',
    rating: 2, 
    user_id: 2,
    product_id: 1,
  )


  Review.create!(
    title: 'Love everything!', 
    body: 'I got the Littles in hopes to find better products for my needs and this did not disappoint! My skin hasnt been better or clearer! I cant wait for the long term results!',
    rating: 5, 
    user_id: 3,
    product_id: 1,
  )


  Review.create!(
    title: 'BE CAREFUL!', 
    body: 'I received a deluxe sample of this in a squeeze tube. When I went to put it on my face, I noticed what seemed like sharp chunks of plastic in my product! I emailed Fun Elephant and they acted like this is a completely normal occurrence due to the salicylic acid crystallizing. That has never happened to me before with any form of SA. SO BE CAREFUL when applying this to your face! I understand that acids can be a delicate balance, but the formation of painful crystals in product is not normal to me! I cant find any information about this product crystallizing anywhere so please be aware that it can happen and it can scratch your face.',
    rating: 1, 
    user_id: 4,
    product_id: 3,
  )

  Review.create!(
    title: 'Bummed', 
    body: 'I really REALLY wanted to enjoy this product. I have been using an $8 store bought facewash for the past 10 years and never had any issues/acne. I decided this year I wanted to up my "face product game" and take care of my face with natural healthy products....and unfortunately it was not ready for a change. After using this product I broke out all over my cheeks and jaw line! To double check it was the product and not something with my diet/hormones, I switched back to the $8 cleanser and my face cleared right up...then I switched back to the Beste Cleanser and the acne came back in the same spots. UGH. Aside from the product giving me acne, it smells great, its super smooth and it even gives your face a little glow.',
    rating: 2, 
    user_id: 5,
    product_id: 3,
  )

  Review.create!(
    title: 'Lives up to the hype', 
    body: 'I have been reading about Babyfacial for a few years now. All comments are stellar reviews. Instead I have bought and tried so many other similar and cheaper products. Trying to make my sensitive acne prone skin happy. Turns out I should have saved the money spent on other products and just bought this one. One use of the kit I recieved with the Babyfacial ald the luxury Marula Oil and my skin was soothed and happy. Instructions say use is once a week. Cant wait to use it next week. Im hooked. Just love it.',
    rating: 5, 
    user_id: 6,
    product_id: 2,
  )

  Review.create!(
    title: 'Unsure...', 
    body: 'I am unsure how I feel about this product. The first time I used it was last week and I woke up with amazingly smooth skin (something I haven‚Äôt had in quite some time). I used this product again last night and woke up with small pimples all over my face (my cheeks, chin, and forehead). I never get pimples on my cheeks so I am really disappointed that this is something directly related to this product. I am going to continue using for a couple of weeks in hopes that this improves.',
    rating: 3, 
    user_id: 7,
    product_id: 2,
  )

  Review.create!(
    title: 'Protini sample is too small', 
    body: 'Protini sample needs to be bigger for this much money. I bought these for a 10 day vacation and had to take a second pot of protini',
    rating: 3, 
    user_id: 8,
    product_id: 4,
  )


  Review.create!(
    title: 'Didnt realize how much I loved this until I finished it', 
    body: 'Ive tried many hydrating serums and gels over the last few year - ranging from chanel to korean products and this is easily my favourite one and the only one I can say is worth its price. This is a clear gel that sinks in quickly and leaves such a wonderful natural finish to the skin. I used this alone as a moisturizer in the summer and will repurchase for the winter to use either as a mixer or moisturizer under the umbra tinte. This leaves a really lovely finish on the skin that wears great under makeup (no primer needed for me) I cant think of any cons to this one if anything I feel like I finished mine too fast',
    rating: 5, 
    user_id: 9,
    product_id: 5,
  )

  Review.create!(
    title: 'The nourishment I craved', 
    body: 'I cannot love the B-hydra serum enough! Its a perfect daytime serum and the best part is I can layer it with any of Drunk Elephants other products. It absorbs in to the skin and does not leave any sticky residue like most other serums. Ive noticed a huge difference in my skin after about 3 months of using this product and this is my second purchase. My skin is smoother, more luminous, and I dont break out as much anymore. I have relatively sensitive skin so other serums and moisturizers irritated my skin and caused breakouts but I dont have this problem with Drunk Elephant. Love it! Cant recommend it enough.',
    rating: 5, 
    user_id: 10,
    product_id: 5,
  )


  Review.create!(
    title: 'Miracle oil', 
    body: 'I have noticed that my sun spots are getting lighter and my skin tone looks even. This is a miracle product that my skin drinks up!!',
    rating: 5, 
    user_id: 11,
    product_id: 6,
  )


  Review.create!(
    title: 'Convert', 
    body: 'I love the C-Tango eye serum. Living through CO winters is hard on the skin. My eyelids have been known to start flaking when I use any anti-aging serum that can sometimes dry you out. This is a great combination of restoration and moisture. My only complaint is the packaging‚Äîwhich goes for all Drunk Elephant products. I love how well it seals for travel BUT you can‚Äôt tell it‚Äôs gonna be gone till BAM it‚Äôs gone. Then, it takes a while to deliver. Don‚Äôt create a product I can‚Äôt live without that you then make me live without ;)',
    rating: 4, 
    user_id: 12,
    product_id: 7,
  )


  Review.create!(
    title: 'Good Stuff', 
    body: 'I like the ingredients and the way it feels on application. I have faith it is brightening, but no empirical evidence. I plan to do a side by side with the Sheba eye serum and will update upon completion. I love the airtight packaging. Really the only reason for one star off is the price and the amount pumped. It is hard to master how to pump the right amount of product since one pump is way too much -- it pumps as much product (a bit more than pea size) as they recommend to cover an entire face with a different product.',
    rating: 5, 
    user_id: 13,
    product_id: 7,
  )

  Review.create!(
    title: 'Wonderful Eye Cream with a Unique, Lovely Texture!', 
    body: 'C-Tango is probably my favorite product from Drunk Elephant (apart from Lippe). The product has a unique, beautiful texture, almost like a gel-cream. It sinks quickly into my skin, but still leaves it hydrated. Best of all, it seems to have helped with my hereditary dark circles! I havent experienced any irritation with this product, even when using it twice a day. As an added bonus, the packaging is SUPER sanitary (and cute!) compared to other eye creams. Two thumbs way up for this DE product!',
    rating: 5, 
    user_id: 14,
    product_id: 7,
  )

  Review.create!(
    title: 'Returned', 
    body: 'I liked the fact that the LaLa cream is rich in ceramides, but I really don‚Äôt like the smell of it. I will stick to the Protini Cream and use a ceramide serum from another brand.',
    rating: 1, 
    user_id: 15,
    product_id: 8,
  )

  Review.create!(
    title: 'Extremely Small product for price', 
    body: 'I knew it was sample size but these are so small I would not have spent over $40 on them. Also not a fan of the cream it leaves a white residue',
    rating: 2, 
    user_id: 16,
    product_id: 8,
  )
  Review.create!(
    title: 'One for my me and one for my sister', 
    body: 'My sister tried mine when were on vacation. She LOVED it I bought it for her. She is too funny, she only uses it on her lip wrinkles, because that what drives her crazy.',
    rating: 5, 
    user_id: 17,
    product_id: 9,
  )
  Review.create!(
    title: 'Use it as a booster!', 
    body: 'I don’t use Ceramighty as an eye cream. Instead, I mix a pump of it into the skincare product smoothie I apply to my entire face and neck, and the result is a skin barrier so fortified that it feels like there’s an invisible, weightless veil of protection sealing in my skin’s moisture. I LOVE it. And at nighttime, I also mix a dab of Wonderwild into the smoothie along with Ceramighty to really seal everything in!',
    rating: 5, 
    user_id: 18,
    product_id: 10,
  )
  Review.create!(
    title: 'Burns my eyes', 
    body: 'The lotion is itself great, but the directions say you can put this not only under your eyes, but also on your eyelids. This would be cool if not for the fact that if you get it in your eyes, they sting like hell. Then your eyes water from the stinging which just increases the stinging as youre wiping away your tears. Ill stick to my C-Tango and Shaba that dont sting.',
    rating: 3, 
    user_id: 19,
    product_id: 10,
  )
  Review.create!(
    title: 'Not bad but wouldnt purchase again', 
    body: 'I bought your new eye cream. It goes on nicely and looks moisturizing. I have never had so much trouble with a pump dispenser before, though. It is all in pieces, now. This dispenser needs some improvement.',
    rating: 3, 
    user_id: 20,
    product_id: 10,
  )

  end