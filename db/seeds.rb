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
      password: 'password123@'
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
      first_name: 'Matthew', 
      last_name: 'Teh',
      email: 'matthewteh@gmail.com', 
      password: 'masshew.slice14'
    )
  
    User.create!(
      first_name: 'Daniel', 
      last_name: 'Lien',
      email: 'daniel@gmail.com', 
      password: 'alwaysleeping123!'
    )
  
    User.create!(
      first_name: 'Cameron', 
      last_name: 'Sanders',
      email: 'leisurellama@mail.com', 
      password: 'llamal0v3r$'
    )
  
    User.create!(
      first_name: 'Diego', 
      last_name: 'Gucci',
      email: 'Gucci4lyfe@mail.com', 
      password: 'sassyButFashional123!'
    )
  
    User.create!(
      first_name: 'Disnee', 
      last_name: 'Tamang',
      email: 'disneeland@hotmail.com', 
      password: 'mikewenttodisneeland123!'
    )
  
    User.create!(
      first_name: 'Taylor', 
      last_name: 'Musolf',
      email: 'itrytobenice@mail.com', 
      password: 'stripes&hats4life'
    )
  
    User.create!(
      first_name: 'Kathy', 
      last_name: 'Ly',
      email: 'sunny4ever@gmail.com', 
      password: 'took00l4sch00l@'
    )

    User.create!(
      first_name: 'Mimi', 
      last_name: 'Ly',
      email: 'bestPersonever@mail.com', 
      password: 'toocool4you123!'
    )

    User.create!(
      first_name: 'Jeffrey', 
      last_name: 'Li',
      email: 'jeffrey2@mail.com', 
      password: 'motorcycleexpert1!'
    )
  
    # 10.times do 
    #   User.create!({
    #     first_name: Faker::Name.first_name(),
    #     last_name: Faker::Name.last_name(),
    #     email: Faker::Internet.unique.email,
    #     password: 'password132!'
    #   }) 
    # end
  
    puts "Done!"

    #SKIN CARE PRODUCTS --------------

    skincare_1 = Product.create!({
      name: "The Littles™ 6.0 ($108 value)", 
      category: "SKIN CARE", 
      price: 74.00,
      desc:"Using them is simple; pick products for your a.m. and p.m. routine based on what your skin needs—that changes every day.",
      usage:"In the morning, try a C for Yourself Smoothie. Mix 1 pump of C-Firma™ Fresh, 1-2 drops of Virgin Marula Oil, and 1 swipe of Protini™ in the palm of your hand and apply to your face for brighter, firmer, healthy-looking skin. Top it all off with Umbra Sheer™ for broad-spectrum UVA/UVB protection.

      In the evening, start by cleansing with Beste™ No. 9 to wash away grime from the day. Then mix and apply a Beauty Call Smoothie—1 pump of T.L.C. Framboos™, 1-2 drops of Virgin Marula Oil, and 1 swipe of Protini™—for smoother, firmer, more radiant skin.",
      ingredients: "C-Firma™ Fresh Day Serum, 9 ml/.3 fl oz (Liquid Serum Base, 8.5 ml/.28 fl oz; Powder, 1.6 g poids net/net wt .05 oz): Water/Aqua/Eau, Dimethyl Isosorbide, Ascorbic Acid, Laureth-23, Glycerin, Tocopherol, Lactobacillus/Pumpkin Ferment Extract, Sclerocarya Birrea Seed Oil, Dipotassium Glycyrrhizate, Glycyrrhiza Glabra (Licorice) Root Extract, Vitis Vinifera (Grape) Juice Extract, Ferulic Acid, Phyllanthus Emblica Fruit Extract, Camellia Sinensis Leaf Extract, Lactobacillus/Punica Granatum Fruit Ferment Extract, Propanediol, Gluconolactone, Sodium Hyaluronate Crosspolymer, Sodium Hyaluronate, Oryza Sativa (Rice) Bran Extract, Glutamylamidoethyl Imidazole, Tetrahydrobisdemethoxydiferuloylmethane, Tetrahydrodemethoxydiferuloylmethane, Tetrahydrodiferuloylmethane, Pentylene Glycol, Caprylhydroxamic Acid, Leuconostoc/Radish Root Ferment Filtrate, Sorbic Acid, Phenoxyethanol, Sodium Benzoate, Caprylyl Glycol, Chondrus Crispus (Carrageenan) Extract, Ethylhexylglycerin."
    })
    skincare_1a = {
      io: URI.open('https://funelephant-seed.s3.us-west-1.amazonaws.com/the_littles.png'),
      filename: 'the_littles.png' 
    } 
    skincare_1b = {
      io: URI.open("https://funelephant-seed.s3.us-west-1.amazonaws.com/1_Littles_6.0_Motion_Sprite.png"),
      filename: '1_Littles_6.0_Motion_Sprite.png'
    }
    skincare_1.photos.attach([skincare_1a,skincare_1b])
    #---------------------
    skincare_2 = Product.create!({
      name: "T.L.C. Sukari Babyfacial™", 
      category: "SKIN CARE", 
      price: 80.00,
      desc:"This next-generation mask is an at-home “facial” that effectively yet gently exfoliates the pore lining and resurfaces by getting rid of built-up dead skin cells. With a whopping 25% AHA / 2% BHA blend of our dream team glycolic, tartaric, lactic, citric, and salicylic acids, this pro-quality formula dramatically smooths texture while minimizing the look of pores, fine lines, and wrinkles. Uniquely formulated with chickpea flour, pumpkin ferment, and a soothing antioxidant blend of matcha tea, milk thistle, and apple, Babyfacial™ delivers incredible brightening and enzymatic action, improves skin’s elastic feel, and reveals the look of a more even, radiant, baby-soft complexion. Think of it as an extra nudge for stubborn dull skin.",
      usage:"Use once weekly. Apply an even layer to clean, dry skin. Leave on for 20 minutes. Rinse thoroughly with warm water and pat dry. Follow immediately with Virgin Marula Luxury Facial Oil for best results. Slight tingling may be experienced.",
      ingredients:"Ingredients: Water (Aqua), Glycolic Acid, Hydroxyethyl Acrylate/Sodium Acryloyldimethyl Taurate Copolymer, Glycerin, Sodium Hydroxide, Salicylic Acid, Aloe Barbadensis Leaf Extract, Camellia Oleifera Leaf Extract, Lactobacillus/Pumpkin Ferment Extract, Lactobacillus/Punica Granatum Fruit Ferment Extract, Opuntia Ficus-Indica Extract, Pyrus Malus (Apple) Fruit Extract, Silybum Marianum Seed Extract, Saccharomyces Cerevisiae Extract, Vitis Vinifera (Grape) Juice Extract, Camellia Sinensis Leaf Powder, Cicer Arietinum Seed Powder, Sclerocarya Birrea Seed Oil, Passiflora Edulis Seed Oil, Leuconostoc/Radish Root Ferment Filtrate, Sodium Hyaluronate Crosspolymer, Sodium PCA, Allantoin, Dipotassium Glycyrrhizate, Dextrin, Polydextrose, Sorbitan Isostearate, Amylopectin, Niacinamide, Phytosphingosine, Lactic Acid, Propanediol, Citric Acid, Titanium Dioxide, Trisodium Ethylenediamine Disuccinate, Polysorbate 60, Caprylyl Glycol, Chlorphenesin, Phenoxyethanol"
    })
    skincare_2a = {
      io: URI.open('https://funelephant-seed.s3.us-west-1.amazonaws.com/Babyfacial_AngledProductShot.png'),
      filename: "Babyfacial_AngledProductShot.png"
    }

    skincare_2b ={
      io: URI.open('https://funelephant-seed.s3.us-west-1.amazonaws.com/2_Babyfacial_MotionSprite.png'),
      filename: "2_Babyfacial_MotionSprite.png"
    }
    skincare_2.photos.attach([skincare_2a,skincare_2b])
    #---------------------
    skincare_3 = Product.create!({
      name: "Beste™ No. 9 Jelly Cleanse", 
      category: "SKIN CARE", 
      price: 16.00,
      desc:"With a unique blend of mild surfactants and makeup-dissolving emollients, this gentle formula rinses away without an ounce of residue, leaving skin clean and soft.",
      usage: "Squeeze Beste™ No. 9 into palm and gently massage over wet or dry skin. Add water to lather. Rinse well and pat dry. Use nightly or in alternation with the other Drunk Elephant cleansers.",
      ingredients:"Ingredients: Water/Aqua/Eau, Glycerin, Cocamidopropyl Betaine, Coco-Glucoside, Sodium Lauroyl Methyl Isethionate, Cocamidopropyl Hydroxysultaine, Sodium Methyl Oleoyl Taurate, Propanediol, Aloe Barbadensis Leaf Extract, Glycolipids, Linoleic Acid, Linolenic Acid, Lauryl Glucoside, Cucumis Melo Cantalupensis Fruit Extract, Sclerocarya Birrea Seed Oil, Dipotassium Glycyrrhizate, Tocopherol, Citric Acid, Phenoxyethanol, Sodium Hydroxide, Sodium Benzoate, Sodium Chloride, Polylysine"
    })
    
    skincare_3a = {
      io: URI.open('https://funelephant-seed.s3.us-west-1.amazonaws.com/Beste_Cleanser_Angled_Shot.png'),
      filename: 'Beste_Cleanser_Angled_Shot.png'
    }

    skincare_3b = {
      io: URI.open('https://funelephant-seed.s3.us-west-1.amazonaws.com/3_Beste_MotionSprite.jpeg'),
      filename: '3_Beste_MotionSprite.jpeg'
    }

    skincare_3.photos.attach([skincare_3a,skincare_3b])
    #-----------------
    skincare_4 = Product.create!({
      name: "Anytime Anyface", 
      category: "SKIN CARE", 
      price: 28.00,
      desc:"Protini™ Serum improves the appearance of skin’s texture, tone, radiance, and bounce, while Protini™ Cream moisturizes and replenishes to restore your skin to a strong, healthy state.",
      usage: "Mix Protini™ Serum and Protini™ Cream in the palm of your hand and apply to a clean, dry face, avoiding the eye area.",
      ingredients: "Water/Aqua/Eau, Dicaprylyl Carbonate, Glycerin, Cetearyl Alcohol, Cetearyl Olivate, Sorbitan Olivate, Sclerocarya Birrea Seed Oil, Bacillus/Folic Acid Ferment Extract, Nymphaea Alba Root Extract, sh-Oligopeptide-1, sh-Oligopeptide-2, sh-Polypeptide-1, sh-Polypeptide-9, sh-Polypeptide-11, Copper Palmitoyl Heptapeptide-14, Heptapeptide-15 Palmitate, Palmitoyl Tetrapeptide-7, Palmitoyl Tripeptide-1, Alanine, Arginine, Glycine, Histidine, Isoleucine, Phenylalanine, Proline, Serine, Threonine, Valine, Acetyl Glutamine, Coconut Alkanes, Coco-Caprylate/Caprate, Sodium Hyaluronate, Aspartic Acid, Linoleic Acid, Linolenic Acid, Lecithin, Butylene Glycol, Polyvinyl Alcohol, Sodium Lactate, Sodium PCA, PCA, Sorbitan Isostearate, Carbomer, Polysorbate 20, Polysorbate 60, Lactic Acid/Glycolic Acid Copolymer, Hydroxyethyl Acrylate/Sodium Acryloyldimethyl Taurate Copolymer, Xanthan Gum, Isomalt, 1,2-Hexanediol, Caprylyl Glycol, Chlorphenesin, Phenoxyethanol, Tocopherol, Sodium Benzoate, Phenylpropanol, Glyceryl Caprylate, Symphytum Officinale Callus Culture Extract"
    })

    skincare_4a = {
      io: URI.open('https://funelephant-seed.s3.us-west-1.amazonaws.com/anytime_anyface.png'),
      filename: "anytime_anyface.png"
    }

    skincare_4b = {
      io: URI.open("https://funelephant-seed.s3.us-west-1.amazonaws.com/4_ATAF_Motion_Sprite.png"),
      filename: '4_ATAF_Motion_Sprite.png'
    }

    skincare_4.photos.attach([skincare_4a,skincare_4b])
    #-----------------

    skincare_5 = Product.create!({
      name: "B-Hydra™ Intensive Hydration Serum", 
      category: "SKIN CARE", 
      price: 48.00,
      desc:"Formulated with pro-vitamin B5 and pineapple ceramide, B-Hydra™ delivers steady hydration throughout the day, leaving the skin looking healthy and more illuminated. Blended with a unique lentil-apple-and-watermelon complex, B-Hydra™ helps diminish drabness, dryness, and the appearance of fine lines. Your complexion will appear brighter and more youthful upon every application.",
      usage: "Apply B-Hydra™ to face, neck, chest, hands, or any place on your body needing increased hydration. Mix with any Drunk Elephant serum, oil, or cream to lock it in.",
      ingredients: "Water/Aqua/Eau, Coconut Alkanes, Ammonium Acryloyldimethyltaurate/VP Copolymer, Glycerin, Pentylene Glycol, Sclerocarya Birrea Seed Oil, Wheat Amino Acids, Ananas Sativus (Pineapple) Fruit Extract, Berberis Vulgaris Root Extract, Citrullus Lanatus (Watermelon) Fruit Extract, Lens Esculenta (Lentil) Fruit Extract, Pyrus Malus (Apple) Fruit Extract, Coco-Caprylate/Caprate, Panthenol, Sodium PCA, Sodium Hyaluronate Crosspolymer, Dipotassium Glycyrrhizate, Niacinamide, Cyclodextrin, Sodium Hyaluronate, Sodium Lactate, Phenoxyethanol, Hydroxyproline, Trisodium Ethylenediamine Disuccinate, Citric Acid, Caprylyl Glycol, Chlorphenesin, Ethylhexylglycerin"
    })

    skincare_5a = {
      io: URI.open('https://funelephant-seed.s3.us-west-1.amazonaws.com/BHydra_AngledShot.png'),
      filename: 'BHydra_AngledShot.png'
    }

    skincare_5b = {
      io: URI.open('https://funelephant-seed.s3.us-west-1.amazonaws.com/5_BHydra_MotionSprite.jpeg'),
      filename: '5_BHydra_MotionSprite.jpeg'
    }
    skincare_5.photos.attach([skincare_5a,skincare_5b])
    #----------------------
    skincare_6 = Product.create!({
      name: "A-Gloei Maretinol Oil", 
      category: "SKIN CARE", 
      price: 72.00,
      desc:"A gentle dose of retinol clarifies, refines, and smooths uneven, blemished, textured, or aging skin. It also evens out tone, reducing discoloration and boosting skin’s natural glow, while ceramides replenish the skin barrier and improve elasticity. Antioxidant- and omega-rich virgin marula oil (which makes up 95% of the formula!) replenishes essential moisture and reduces the appearance of redness, bringing skin back to its healthiest, most youthful state.",
      usage: "Morning or night, apply 2-3 drops to a clean, dry face. May be mixed with any Drunk Elephant moisturizer or serum. Always use a broad-spectrum sunscreen.",
      ingredients: "Sclerocarya Birrea Seed Oil, Glycine Soja (Soybean) Oil, Retinol, Tocopherol, Ceramide AP, Ceramide NP."
    })

    skincare_6a = {
      io: URI.open('https://funelephant-seed.s3.us-west-1.amazonaws.com/A-Gloei_Angled_Product_Shot.png'),
      filename: 'A-Gloei_Angled_Product_Shot.png' 
    }
    skincare_6b = {
      io: URI.open('https://funelephant-seed.s3.us-west-1.amazonaws.com/6_A-Gloei_Motion_Sprite.jpeg'),
      filename: '6_A-Gloei_Motion_Sprite.jpeg'
    }
    skincare_6.photos.attach([skincare_6a,skincare_6b])
    #--------------
    skincare_7 = Product.create!({
      name: "C-Tango™ Multivitamin Eye Cream", 
      category: "SKIN CARE", 
      price: 64.00,
      desc:"C-Tango™ is a dance of potent antioxidants, replenishing ceramides and plant oils, and soothing actives, all designed to refresh skin and restore a radiant appearance. Gentle enough for a.m. and p.m. use and powerful enough to improve even stubborn signs of damage.",
      usage: "Gently pat a pump of C-Tango™ around the eye area using your ring finger. May be mixed with Shaba Complex™ Eye Serum.",
      ingredients: "Water/Aqua/Eau, Glycerin, Dicaprylyl Carbonate, Cetearyl Alcohol, Caprylic/Capric Triglyceride, Hydroxyethyl Acrylate/Sodium Acryloyldimethyl Taurate Copolymer, Sodium Ascorbyl Phosphate, Cetearyl Olivate, Sorbitan Olivate, Sclerocarya Birrea Seed Oil, Persea Gratissima (Avocado) Oil, Plukenetia Volubilis Seed Oil, Magnesium Ascorbyl Phosphate, Ceteareth-6 Olivate, Tetrahexyldecyl Ascorbate, Ascorbyl Glucoside, Ascorbyl Palmitate, Palmitoyl Tripeptide-1, Glycine Soja (Soybean) Sterols, Linoleic Acid, Phospholipids, Ceramide NP, Glycine Soja (Soybean) Protein, Ceramide AP, Phytosphingosine, Cholesterol, Ceramide EOP, Cucumis Sativus (Cucumber) Fruit Extract, Camellia Sinensis Leaf Extract, Palmitoyl Dipeptide-5 Diaminobutyroyl Hydroxythreonine, Palmitoyl Dipeptide-5 Diaminohydroxybutyrate, Dipeptide Diaminobutyroyl Benzylamide Diacetate, Sodium Hyaluronate Crosspolymer, C12-15 Alkyl Benzoate, Panthenol, Dipotassium Glycyrrhizate, Hesperidin Methyl Chalcone, Dipeptide-2, Palmitoyl Tetrapeptide-7, Fragaria Ananassa (Strawberry) Seed Extract, Medicago Sativa (Alfalfa) Extract, Morus Alba Leaf Extract, Hydrolyzed Rice Protein, Spilanthes Acmella Flower Extract, Aloe Barbadensis Leaf Juice, Ubiquinone, Superoxide Dismutase, Palmitoyl Tripeptide-38, Acetyl Hexapeptide-8, Pyrus Malus (Apple) Fruit Extract, Phytic Acid, Actinidia Chinensis (Kiwi) Fruit Extract."
    })

    skincare_7a = {
      io: URI.open('https://funelephant-seed.s3.us-west-1.amazonaws.com/C-Tango-Angled-Shot.png'),
      filename: 'C-Tango-Angled-Shot.png'
    }
    skincare_7b = {
      io: URI.open("https://funelephant-seed.s3.us-west-1.amazonaws.com/7_CTango_MotionSprite.jpeg"),
      filename:'7_CTango_MotionSprite.jpeg'
    }
    skincare_7.photos.attach([skincare_7a,skincare_7b])
    #-------------------
    skincare_8 = Product.create!({
      name: "Call It a Night Duo ($42 value)", 
      category: "SKIN CARE", 
      price: 28.00,
      desc:"This multifaceted rescue cream provides replenishing barrier support by reinforcing skin’s acid mantle and defending against the effects of everyday stressors.",
      usage: "In the evening, mix T.L.C. Framboos™ and Lala Retro™ in the palm of hand and apply to a clean, dry face, neck, chest, and backs of hands. Not for eye area.",
      ingredients: "Water/Aqua/Eau, Glycolic Acid, Butylene Glycol, Glycerin, Sodium Hydroxide, Lactic Acid, Salicylic Acid, Tartaric Acid, Vitis Vinifera (Grape) Juice Extract, Aloe Barbadensis Leaf Juice, Opuntia Ficus-Indica Extract, Aesculus Hippocastanum (Horse Chestnut) Seed Extract, Camellia Sinensis Leaf Extract, Rubus Idaeus (Raspberry) Fruit Extract, Saccharomyces Cerevisiae Extract, Buddleja Davidii Meristem Cell Culture, Sclerocarya Birrea Seed Oil, Sodium Hyaluronate Crosspolymer, Allantoin, Hydroxyethylcellulose, Galactoarabinan, Propanediol, Citric Acid, Tetrasodium Glutamate Diacetate, Xanthan Gum, Hexylene Glycol, Phenoxyethanol, Sodium Benzoate, Caprylyl Glycol, Potassium Sorbate, Pentylene Glycol, Sodium Carbonate, Sodium Chloride, Disodium Phosphate, Sodium Phosphate, Ethylhexylglycerin"
    })

    skincare_8a = {
      io: URI.open('https://funelephant-seed.s3.us-west-1.amazonaws.com/Call_It_A_Night_Angled_Shot.png'),
      filename: 'Call_It_A_Night_Angled_Shot.png'
    }
    skincare_8b = {
      io: URI.open('https://funelephant-seed.s3.us-west-1.amazonaws.com/8_CIAN_MotionSprite.jpeg')
      filename: '8_CIAN_MotionSprite.jpeg'
    }
    skincare_8.photos.attach([skincare_8a,skincare_8b])
    #-----------------------
    skincare_9 = Product.create!({
      name: "A-Passioni™ Retinol Cream", 
      category: "SKIN CARE", 
      price: 28.00,
      desc:"Retinol and supportive peptides restore bounce, resilience, and a brighter clarity to skin while helping to even skin tone and texture—without the associated redness and irritation. Vitamin F and a blend of comforting passionfruit, apricot, marula, and jojoba oils replenish essential lipids and moisture, while antioxidant-packed kale, winter cherry, and xanthophylls help defend against environmental stressors. It’s like a reboot of your skin back to its healthiest, most youthful state.",
      usage: "Morning or night, apply a pea-size amount (about half a pump) or less to clean, dry face, avoiding the eye area.  May be mixed with any Drunk Elephant cream or oil. Limit initial use to once or twice a week, gradually increasing frequency to every other night, and then every night as tolerated. Always use a broad spectrum sunscreen. Retinol products are not recommended for use by pregnant or nursing mothers. Always check with your doctor before using any new products while pregnant or nursing.",
      ingredients: "Water/Aqua/Eau, Glycerin, Coco-Caprylate, Stearic Acid, Coconut Alkanes, Glyceryl Stearate, Niacinamide, Caprylic/Capric Triglyceride, Cetearyl Alcohol, Pentylene Glycol, Passiflora Edulis Seed Oil, Retinol, Simmondsia Chinensis (Jojoba) Seed Oil, Sclerocarya Birrea Seed Oil, Prunus Armeniaca (Apricot) Kernel Oil, Cetyl Ethylhexanoate, Palmitoyl Tripeptide-1, Palmitoyl Tetrapeptide-7, Brassica Oleracea Acephala Leaf Extract, Brassica Oleracea Italica (Broccoli) Extract, Tetrahexyldecyl Ascorbate, Chrysin, Persea Gratissima (Avocado) Oil, Linoleic Acid, Linolenic Acid, Ceramide NP, Xanthophylls, Phytosphingosine, Phytosterols, Jojoba Esters, Physalis Pubescens Fruit Juice, Stearyl Glycyrrhetinate, Oryza Sativa (Rice Bran) Extract, Glycine Soja (Soybean) Oil, Carthamus Tinctorium (Safflower) Seed Oil."
    })

    skincare_9a = {
      io: URI.open('https://funelephant-seed.s3.us-west-1.amazonaws.com/APassioni_AngledProductShot.png'),
      filename: 'APassioni_AngledProductShot.png'
    }

    skincare_9b = {
      io: URI.open('https://funelephant-seed.s3.us-west-1.amazonaws.com/9_APassioni_MotionSprite.jpeg'),
      filename: '9_APassioni_MotionSprite.jpeg'
    }
    skincare_9.photos.attach([skincare_9a,skincare_9b])
    #---------------
    sincare_10 = Product.create!({
      name: "Ceramighty™ AF Eye Balm", 
      category: "SKIN CARE", 
      price: 60.00,
      desc:"Loaded with ceramides, vitamin F, and omega-rich plant oils and butters, Ceramighty™ AF Eye Balm deeply nourishes and strengthens the skin barrier, restoring and preserving elasticity while delivering intense, long-lasting moisture. Soothing Avena sativa (oat) extract helps to calm skin and relieve the appearance of fatigue around the eye area.",
      usage: "Gently pat one pump under the eyes, along the orbital bone, and on the eyelids, morning or night.",
      ingredients: " Water/Aqua/Eau, Octyldodecanol, Glycerin, Sclerocarya Birrea Seed Butter, Linoleic Acid, Glyceryl Stearate, Palmitic Acid, Pentylene Glycol, Cetearyl Alcohol, Stearic Acid, Sclerocarya Birrea Seed Oil, Persea Gratissima (Avocado) Oil, Avena Sativa (Oat) Kernel Oil, Oenothera Biennis (Evening Primrose) Oil, Linum Usitatissimum (Linseed) Seed Oil, Salvia Hispanica Seed Oil, Simmondsia Chinensis (Jojoba) Seed Oil, Ceramide AP, Ceramide NP, Ceramide EOP, Avena Sativa (Oat) Kernel Extract, Panthenol, Linolenic Acid, Adenosine, Beta-Glucan, Quercetin, Allantoin, Sodium Lauroyl Lactylate, Phytosphingosine, Cholesterol, Xanthan Gum, Tetrasodium Glutamate Diacetate, Propanediol, Citric Acid, Ceteareth-20, Sodium Carbonate, Phenoxyethanol, Sodium Chloride, Caprylyl Glycol, Sodium Hydroxide, Chlorphenesin, Carbomer, Ethylhexylglycerin"
    })

    skincare_10a = {
      io: URI.open('https://funelephant-seed.s3.us-west-1.amazonaws.com/Ceramighty.png'),
      filename: 'Ceramighty.png'
    }
    skincare_10b = {
      io: URI.open('https://funelephant-seed.s3.us-west-1.amazonaws.com/10_Ceramighty_Motion_Sprite.png')
      filename: '10_Ceramighty_Motion_Sprite.png'
    }
    skincare_10.photos.attach([skincare_10a,skincare_10b]) 
    #---------------------
    skincare_11 = Product.create!({
      name: "C-Firma™ Fresh Day Serum", 
      category: "SKIN CARE", 
      price: 78.00,
      desc:"C-Firma™ Fresh Day Serum is designed to be mixed by you before its first use, which maximizes the potency of its delicate (but powerful) ingredients while keeping the formula fresh. This revolutionary vitamin C serum is packed with a powerful antioxidant complex of 15% l-ascorbic acid, 0.5% ferulic acid, and 1% vitamin E to reveal a brighter, firmer, and more even-looking complexion. Potently formulated with pumpkin ferment extract and sodium hyaluronate crosspolymer, C-Firma™ helps to enzymatically dissolve surface dead skin cells as it hydrates and soothes. The result is a noticeably diminished appearance of signs of aging and photodamage—replaced by incredible radiance and luminosity.",
      usage: "Unscrew the cap of the liquid serum base and remove the pump from the vial containing the 15% I-ascorbic acid power.

      Pour all of the liquid serum base into the vial with the powder. Screw the pump onto the top of the vial and shake for one minute until the powder dissolves fully. Bubbles will form-that's OK!
      
      Finally, insert the vial into C-Firma's opaque outer container with the pump facing to the left until it snaps into place. Your C-Firma™ Fresh Day Serum is ready to use.",
      ingredients: "Water/Aqua/Eau, Dimethyl Isosorbide, Ascorbic Acid, Laureth-23, Glycerin, Tocopherol, Lactobacillus/Pumpkin Ferment Extract, Sclerocarya Birrea Seed Oil, Dipotassium Glycyrrhizate, Glycyrrhiza Glabra (Licorice) Root Extract, Vitis Vinifera (Grape) Juice Extract, Ferulic Acid, Phyllanthus Emblica Fruit Extract, Camellia Sinensis Leaf Extract, Lactobacillus/Punica Granatum Fruit Ferment Extract, Propanediol, Gluconolactone, Sodium Hyaluronate Crosspolymer, Sodium Hyaluronate, Oryza Sativa (Rice) Bran Extract, Glutamylamidoethyl Imidazole, Tetrahydrobisdemethoxydiferuloylmethane, Tetrahydrodemethoxydiferuloylmethane, Tetrahydrodiferuloylmethane, Pentylene Glycol, Caprylhydroxamic Acid, Leuconostoc/Radish Root Ferment Filtrate, Sorbic Acid, Phenoxyethanol, Sodium Benzoate, Caprylyl Glycol, Chondrus Crispus (Carrageenan) Extract, Ethylhexylglycerin."
    })

    skincare_11a = {
      io: URI.open('https://funelephant-seed.s3.us-west-1.amazonaws.com/CFirmaFresh_Angled_.png'),
      filename: 'CFirmaFresh_Angled_.png' 
    }

    skincare_11b = {
      io: URI.open('https://funelephant-seed.s3.us-west-1.amazonaws.com/11_C-Firma_Fresh_MotionSprite_update.jpeg'),
      filename: '11_C-Firma_Fresh_MotionSprite_update.jpeg'
    }
    skincare_11.photos.attach([skincare_11a,skincare_11b])
    #---------------
    skincare_12 = Product.create!({
      name: "D-Bronzi™ Anti-Pollution Sunshine Drops", 
      category: "SKIN CARE", 
      price: 36.00,
      desc:"Like sunshine in a bottle without the damaging effects. Omega-rich virgin marula and black currant seed oils, along with vitamin F (fatty acids), immediately replenish the delicate balance that supports a healthy barrier function, while a concentrated mix of protective antioxidants boosts skin’s defenses against pollution and environmental stressors—all delivered with a bronzy finish.",
      usage: "Add a drop of D-Bronzi™ to any Drunk Elephant serum, oil, or moisturizer for a gorgeous glow and a potent dose of protective antioxidants and omega fatty acids.",
      ingredients: "Water/Aqua/Eau, Hydrogenated Polyisobutene, Glyceryl Oleate Citrate, Mica, Hydroxyethyl Acrylate/Sodium Acryloyldimethyl Taurate Copolymer, Glycerin, Ribes Nigrum (Black Currant) Seed Oil, Sclerocarya Birrea Seed Oil, Theobroma Cacao (Cocoa) Extract, Caprylic/Capric Triglyceride, Vitis Vinifera (Grape) Seed Extract, Lecithin, Acetyl Tetrapeptide-17, Linoleic Acid, Linolenic Acid, Sorbitan Isostearate, Camellia Sinensis Leaf Extract, Maltodextrin, Sodium Hyaluronate Crosspolymer, Magnolia Officinalis Bark Extract, Glutamylamidoethyl Imidazole, Colloidal Platinum [nano], Tocopherol, Phenoxyethanol, Pentylene Glycol, Sodium Benzoate, Sorbic Acid, Caprylyl Glycol, Boron Nitride, Hexylene Glycol, Polysorbate 60, Ethylhexylglycerin, CI 77491 (Iron Oxides), CI 77492 (Iron Oxides), CI 77499 (Iron Oxides), Sodium C14-16 Olefin Sulfonate"
    })

    skincare_12a = {
      io:URI.open('https://funelephant-seed.s3.us-west-1.amazonaws.com/D-Bronzi_Angled_Shot.png'),
      filename: 'D-Bronzi_Angled_Shot.png'
    }

    skincare_12b = {
      io: URI.open('https://funelephant-seed.s3.us-west-1.amazonaws.com/12_DBronzi_MotionSprite.jpeg'),
      filename: '12_DBronzi_MotionSprite.jpeg'
    }
    skincare_12.photos.attach([skincare_12a,skincare_12b]) 
    #---------------
    skincare_13 = Product.create!({
      name: "E-Rase™ Milki Micellar Water", 
      category: "SKIN CARE", 
      price: 28.00,
      desc:"Made with ultra-mild micelles, soothing vitamin E, replenishing fatty acids, and antioxidant-rich, nonfragrant plant oils (marula, baobab, mongongo, wild melon seed, ximenia seed, passionfruit, and sweet almond), E-Rase™ nourishes skin while dissolving and lifting away makeup and dirt, is barrier-supportive, and may be used anytime you need a quick skin refreshment.",
      usage: "Shake before use. Gently smooth over face, eyes, and lips with a soft cotton pad, holding for a few seconds on heavily made-up areas. Don’t scrub, tug, or rub. May also be used anytime in between facial cleansing—no need to rinse. Skin feels clean, cool, and soft after each use.",
      ingredients: "Water/Aqua/Eau, Cetearyl Isononanoate, Propanediol, C15-19 Alkane, Dicaprylyl Carbonate, Heptyl Undecylenate, Sclerocarya Birrea Seed Oil, Adansonia Digitata Seed Oil, Prunus Amygdalus Dulcis (Sweet Almond) Oil, Schinziophyton Rautanenii Kernel Oil, Tocopherol, Acrylates/C10-30 Alkyl Acrylate Crosspolymer, Citrullus Lanatus (Watermelon) Seed Oil, Ximenia Americana Seed Oil, Sodium Lauroyl Lactylate, Ceramide AP, Ceramide EOP, Ceramide NP, Cholesterol, Phytosphingosine, Xanthan Gum, Carbomer, Sodium Hydroxide, Phenoxyethanol, Potassium Sorbate, Polysorbate 20, Ethylhexylglycerin"
    })

    skincare_13a = {
      io: URI.open('https://funelephant-seed.s3.us-west-1.amazonaws.com/E-Rase_Angled_Shot.png'),
      filename: 'E-Rase_Angled_Shot.png'
    }

    skincare_13b = {
      io: URI.open('https://funelephant-seed.s3.us-west-1.amazonaws.com/13_ERase_Motion_Sprite.jpeg'),
      filename: '13_ERase_Motion_Sprite.jpeg'
    }
    skincare_13.photos.attach([skincare_13a,skincare_13b])
    #---------------
    skincare_14 = Product.create!({
      name: "It's Summer Somewhere ($39 value)", 
      category: "SKIN CARE", 
      price: 30.00,
      desc:"O-Bloos™ gives a golden peachy-pink wash of color while keeping skin soft and soothed; D-Bronzi™ supports a healthy barrier function and delivers a bronzy finish; Lala Retro™ provides barrier support by reinforcing skin’s acid mantle and defending against the effects of everyday stressors.",
      usage: "Mix a drop or two of O-Bloos™ and D-Bronzi™ with a swipe of Lala Retro™ in the palm of your hand and apply to a clean, dry face.",
      ingredients: "Water/Aqua/Eau, Hydrogenated Polyisobutene, Glyceryl Oleate Citrate, Hydroxyethyl Acrylate/Sodium Acryloyldimethyl Taurate Copolymer, Glycerin, Ribes Nigrum (Black Currant) Seed Oil, Sclerocarya Birrea Seed Oil, Theobroma Cacao (Cocoa) Extract, Caprylic/Capric Triglyceride, Palmitoyl Tripeptide-1, Vitis Vinifera (Grape) Juice Extract, Caesalpinia Sappan Bark Extract, Sodium Lactate, Palmitoyl Tetrapeptide-7, Linoleic Acid, Linolenic Acid, Sorbitan Isostearate, Camellia Sinensis Leaf Extract, Propanediol, Sodium Hyaluronate Crosspolymer, Glutamylamidoethyl Imidazole, Silica, Butylene Glycol, Tocopherol, Polysorbate 20, Carbomer, Xanthan Gum, Phenoxyethanol, Pentylene Glycol, Sodium Benzoate, Sorbic Acid, Sodium Citrate, Caprylyl Glycol, Boron Nitride, Hexylene Glycol, Polysorbate 60, Ethylhexylglycerin, Tin Oxide. [+/- (May Contain/Peut Contenir): Mica, CI 77891 (Titanium Dioxide), CI 77491 (Iron Oxides)]"
    })
    skincare_14a = {
      io: URI.open('https://funelephant-seed.s3.us-west-1.amazonaws.com/its_summer_somewhere.png'),
      filename: 'its_summer_somewhere.png'
    }

    skincare_14b = {
      io: URI.open('https://funelephant-seed.s3.us-west-1.amazonaws.com/14_ISS_Motion_Sprite.png'),
      filename: '14_ISS_Motion_Sprite.png'
    }
    skincare_14.photos.attach([skincare_14a,skincare_14b]) 
    #---------------
    skincare_15 = Product.create!({
      name: "Juju Bar", 
      category: "SKIN CARE", 
      price: 28.00,
      desc:"This multitasking bar is designed to effectively cleanse while gently removing dead skin cells from the surface of the skin. Infused with a blend of thermal mud, marula, bamboo, and superfruit, this unique formulation creates a creamy lather that dissolves excess oil, pore-clogging surface debris, and impurities while gently exfoliating dead skin cells. Skin feels softer and smoother with improved clarity.",
      usage: "Wet Juju Bar and lather until creamy. With your hands, gently massage over face, neck, and chest. Rinse with warm water and pat dry. Use 2 or 3 times per week. Do not apply bar directly to skin. Avoid direct contact with eyes.",
      ingredients: "Sodium Coco-Sulfate, Disodium Lauryl Sulfosuccinate, Triticum Vulgare (Wheat) Starch, Cetearyl Alcohol, Bambusa Vulgaris Leaf/Stem Extract, Paraffin, Sclerocarya Birrea Seed Oil, Water/Aqua/Eau, Heilmoor Clay, Titanium Dioxide (CI 77891), Helianthus Annuus (Sunflower) Seed Oil, Euterpe Oleracea Fruit Extract, Lycium Barbarum Fruit Extract"
    })

    skincare_15a = {
      io: URI.open('https://funelephant-seed.s3.us-west-1.amazonaws.com/Juju_Bar_Angled_Shot.png'),
      filename: 'Juju_Bar_Angled_Shot.png'
    }

    skincare_15b = {
      io: URI.open('https://funelephant-seed.s3.us-west-1.amazonaws.com/15_Juju_MotionSprite.jpeg'),
      filename: '15_Juju_MotionSprite.jpeg'
    }

    skincare_15.photos.attach([skincare_15a,skincare_15b]) 
    #---------------
    skincare_16 = Product.create!({
      name: "Lala Retro™ Whipped Cream", 
      category: "SKIN CARE", 
      price: 60.00,
      desc:"Lala Retro™ is a whipped dream-come-true for tired, dry skin. This  multifaceted rescue cream, infused with six African oils and a plant ceramide complex, provides replenishing barrier support by reinforcing skin’s acid mantle and defending against the effects of everyday stressors. Sodium hyaluronate crosspolymer easily soaks in to release intense hydration. In addition, antioxidant-rich fermented green tea helps combat signs of aging. Loaded with omega acids, Lala helps skin retain long-lasting moisture, forming a protective layer that allows skin to function at its optimal level.",
      usage: "Apply a pump of Lala Retro™ anytime to clean, dry skin. Mix with any Drunk Elephant serum or oil as part of a total skincare solution.",
      ingredients: "Water/Aqua/Eau, Glycerin, Caprylic/Capric Triglyceride, Isopropyl Isostearate, Pseudozyma Epicola/Camellia Sinensis Seed Oil/Glucose/Glycine Soja (Soybean) Meal/Malt Extract/Yeast Extract Ferment Filtrate, Glyceryl Stearate SE, Cetearyl Alcohol, Palmitic Acid, Stearic Acid, Pentylene Glycol, Plantago Lanceolata Leaf Extract, Adansonia Digitata Seed Oil, Citrullus Lanatus (Watermelon) Seed Oil, Passiï¬‚ora Edulis Seed Oil, Schinziophyton Rautanenii Kernel Oil, Sclerocarya Birrea Seed Oil, Polyglyceryl-6 Ximenia Americana Seedate, Cholesterol, Ceramide AP, Ceramide EOP, Sodium Hyaluronate Crosspolymer, Ceramide NP, Phytosphingosine, Ceteareth-20, Trisodium Ethylenediamine Disuccinate, Tocopherol, Sodium Lauroyl Lactylate, Sodium Hydroxide, Citric Acid, Carbomer, Xanthan Gum, Caprylyl Glycol, Chlorphenesin, Phenoxyethanol, Ethylhexylglycerin"
    })
    skincare_16a = {
      io: URI.open('https://funelephant-seed.s3.us-west-1.amazonaws.com/Lala_Angled_Shot.png'),
      filename: 'Lala_Angled_Shot.png'
    }

    skincare_16b = {
      io: URI.open('https://funelephant-seed.s3.us-west-1.amazonaws.com/16_Lala_MotionSprite.jpeg'),
      filename: '16_Lala_MotionSprite.jpeg'
    }

    skincare_16.photos.attach([skincare_16a,skincare_16b]) 
    #---------------
    skincare_17 = Product.create!({
      name: "Lippe Balm", 
      category: "SKIN CARE", 
      price: 18.00,
      desc:"Spiked with an antioxidant-rich blend of avocado and mongongo nut oils, plus a tripeptide and sea fern algae, Lippe gives lips a plump look and a better-defined lip line. This buttery, luxurious balm softens and plumps the look of rough, parched lips, keeping them in lip-top condition.",
      usage: "Apply to lips as needed. Use alone as a sheer lip balm or under any lipstick for a silky smooth application.",
      description: "Cocos Nucifera (Coconut) Oil, Sclerocarya Birrea Seed Oil, Butyrospermum Parkii (Shea) Butter, Caprylic/Capric Triglyceride, Bis-Diglyceryl Polyacyladipate-2, Beeswax/Cera Alba/Cire d’abeille, Ozokerite, Polyisobutene, Glycine Soja (Soybean) Oil, Copernicia Cerifera (Carnauba) Wax/Cera Carnauba/Cire de carnauba, Euphorbia Cerifera (Candelilla) Wax/Candelilla Cera/Cire de candelilla, Camellia Oleifera Leaf Extract, Dictyopteris Membranacea Extract, Magnolia Grandiflora Bark Extract, Carthamus Tinctorius (Safflower) Seed Oil, Persea Gratissima (Avocado) Oil, Schinziophyton Rautanenii (Mongongo) Kernel Oil, Vaccinium Macrocarpon (Cranberry) Seed Oil, Tocopheryl Acetate, Dipotassium Glycyrrhizate, Palmitoyl Tripeptide-1, Tetrahexyldecyl Ascorbate, Ethylhexyl Palmitate, Dicaprylyl Ether, Tribehenin, Sorbitan Isostearate, Lauryl Alcohol, Linoleic Acid, Linolenic Acid, Caprylyl Glycol, Phenoxyethanol "
    })
    skincare_17a = {
      io: URI.open('https://funelephant-seed.s3.us-west-1.amazonaws.com/Lippe_Balm_Angled_Shot.png'),
      filename: 'Lippe_Balm_Angled_Shot.png'
    }

    skincare_17b = {
      io: URI.open('https://funelephant-seed.s3.us-west-1.amazonaws.com/17_Lippe_MotionSprite.jpeg'),
      filename: '17_Lippe_MotionSprite.jpeg'
    }

    skincare_17.photos.attach([skincare_17a,skincare_17b]) 
    #---------------
    skincare_18 = Product.create!({
      name: "Wonderwild™ Miracle Butter", 
      category: "SKIN CARE", 
      price: 30.00,
      desc:"Restorative plant butters—marula, cupuaçu, mango, and shea—help shield skin from environmental stressors, while antioxidant- and fatty-acid-rich plant oils (such as meadowfoam, pumpkin, green tea seed, kukui, and rose hip) replenish vital lipids to deeply nourish and strengthen a temporarily compromised skin barrier, bringing skin back to its healthiest state.",
      usage: "Dab it any place that needs extra love. Wonderwild™ Miracle Butter may be applied anywhere on the face and body, including the eye area and lips, as often as needed.",
      ingredients: "Sclerocarya Birrea Seed Oil, Cocos Nucifera (Coconut) Oil, Hydrogenated Vegetable Oil, Cucurbita Pepo (Pumpkin) Seed Oil, Butyrospermum Parkii (Shea) Butter, Sclerocarya Birrea Seed Butter, Mangifera Indica (Mango) Seed Butter, Theobroma Grandiflorum Seed Butter, Camellia Sinensis Seed Oil, Rosa Canina Fruit Oil, Aleurites Moluccanus Seed Oil, Simmondsia Chinensis (Jojoba) Seed Oil, Limnanthes Alba (Meadowfoam) Seed Oil, Oryza Sativa (Rice) Bran Oil, Persea Gratissima (Avocado) Oil, Helianthus Annuus (Sunflower) Seed Wax, Vitis Vinifera (Grape) Seed Oil"
    })

    skincare_18a = {
      io: URI.open('https://funelephant-seed.s3.us-west-1.amazonaws.com/Wonderwild_AngledProductShot.png'),
      filename: 'Wonderwild_AngledProductShot.png'
    }

    skincare_18b = {
      io: URI.open('https://funelephant-seed.s3.us-west-1.amazonaws.com/32_Wonderwild_MotionSprite.jpeg'),
      filename: '32_Wonderwild_MotionSprite.jpeg'
    }

    skincare_18.photos.attach([skincare_18a,skincare_18b]) 
    #---------------
    skincare_19 = Product.create!({
      name: "O-Bloos™ Rosi Drops", 
      category: "SKIN CARE", 
      price: 36.00,
      desc:"O-Bloos™ (the O stands for omegas) gives skin that flattering “nobody knows why you’re flushed” flush. The foolproof, watercolor-light formula is buildable and flatters most skin, and it’s delivered in concentrated drops that can be mixed into your other Drunk Elephant products.",
      usage: "Shake before use. Dab a tiny bit of O-Bloos™ onto cheeks or anywhere you would like to add a warm, natural-looking flush of peachy-pink color and barrier-fortifying omega fatty acids. Or add a drop or two to your serum, cream, or oil for an allover rosy wash of color. Tip: Mix a drop of O-Bloos™ and a drop of D-Bronzi™ into your moisturizer for a flush with added warmth. ",
      ingredients: "Water/Aqua/Eau, Hydrogenated Polyisobutene, Glyceryl Oleate Citrate, Hydroxyethyl Acrylate/Sodium Acryloyldimethyl Taurate Copolymer, Glycerin, Ribes Nigrum (Black Currant) Seed Oil, Sclerocarya Birrea Seed Oil, Theobroma Cacao (Cocoa) Extract, Caprylic/Capric Triglyceride, Palmitoyl Tripeptide-1, Vitis Vinifera (Grape) Juice Extract, Caesalpinia Sappan Bark Extract, Sodium Lactate, Palmitoyl Tetrapeptide-7, Linoleic Acid, Linolenic Acid, Sorbitan Isostearate, Camellia Sinensis Leaf Extract, Propanediol, Sodium Hyaluronate Crosspolymer, Glutamylamidoethyl Imidazole, Silica, Butylene Glycol, Tocopherol, Polysorbate 20, Carbomer, Xanthan Gum, Phenoxyethanol, Pentylene Glycol, Sodium Benzoate, Sorbic Acid, Sodium Citrate, Caprylyl Glycol, Boron Nitride, Hexylene Glycol, Polysorbate 60, Ethylhexylglycerin, Tin Oxide.  [+/- (May Contain/Peut Contenir): Mica, CI 77891 (Titanium Dioxide), CI 77491 (Iron Oxides)]"
    })
    skincare_19a = {
      io: URI.open('https://funelephant-seed.s3.us-west-1.amazonaws.com/O-Bloos_Angled_Shot_new.png'),
      filename: 'O-Bloos_Angled_Shot_new.png'
    }

    skincare_19b = {
      io: URI.open('https://funelephant-seed.s3.us-west-1.amazonaws.com/19_O-Bloos_Motion_Sprite.jpeg'),
      filename: '19_O-Bloos_Motion_Sprite.jpeg'
    }

    skincare_19.photos.attach([skincare_19a,skincare_19b]) 
    #---------------
    skincare_20 = Product.create!({
      name: "Pekee Bar™", 
      category: "SKIN CARE", 
      price: 28.00,
      desc:"Infused with a blend of blueberry extract, marula oil, and honey, Pekee Bar™ tones and promotes moisture retention for skin that feels firmer and more elastic. Pekee Bar™ is totally fragrance- and soap-free and formulated with only skin-friendly ingredients designed to cleanse and calm the skin.",
      usage: "Wet Pekee Bar™ and lather until creamy. With your hands, massage over face, neck, and chest. Rinse well with warm water and pat dry. Use morning or night. Avoid direct contact with eyes.",
      ingredients: "Sodium Coco-Sulfate, Disodium Lauryl Sulfosuccinate, Triticum Vulgare (Wheat) Starch, Cetearyl Alcohol, Paraffin, Sclerocarya Birrea Seed Oil, Water/Aqua/Eau, Titanium Dioxide (CI 77891), Honey/Mel/Miel, Glycerin, Vaccinium Angustifolium (Blueberry) Fruit Extract"
    })
    skincare_20a = {
      io: URI.open('https://funelephant-seed.s3.us-west-1.amazonaws.com/Pekee_Bar_Angled_Shot.png'),
      filename: 'Pekee_Bar_Angled_Shot.png'
    }

    skincare_20b = {
      io: URI.open('https://funelephant-seed.s3.us-west-1.amazonaws.com/20_Pekee_MotionSprite.jpeg'),
      filename: '20_Pekee_MotionSprite.jpeg'
    }
    skincare_20.photos.attach([skincare_20a,skincare_20b]) 
    #---------------
    skincare_21 = Product.create!({
      name: "Protini™ Polypeptide Cream", 
      category: "SKIN CARE", 
      price: 22.00,
      desc:"Protini’s proprietary formula restores younger, revived-looking skin, almost from the first application. Lines, wrinkles, and signs of sun damage appear reduced, and skin feels strengthened and moisturized.",
      usage: "Apply morning and night to clean, dry skin for the vital dose of protein and replenishing moisture the skin needs to retain its youthful appearance. Mix with any Drunk Elephant serum, cream, or oil as part of a total skin-care solution.",
      ingredients: "Water/Aqua/Eau, Dicaprylyl Carbonate, Glycerin, Cetearyl Alcohol, Cetearyl Olivate, Sorbitan Olivate, Sclerocarya Birrea Seed Oil, Bacillus/Folic Acid Ferment Extract, Nymphaea Alba Root Extract, sh-Oligopeptide-1, sh-Oligopeptide-2, sh-Polypeptide-1, sh-Polypeptide-9, sh-Polypeptide-11, Copper Palmitoyl Heptapeptide-14, Heptapeptide-15 Palmitate, Palmitoyl Tetrapeptide-7, Palmitoyl Tripeptide-1, Alanine, Arginine, Glycine, Histidine, Isoleucine, Phenylalanine, Proline, Serine, Threonine, Valine, Acetyl Glutamine, Coconut Alkanes, Coco-Caprylate/Caprate, Sodium Hyaluronate, Aspartic Acid, Linoleic Acid, Linolenic Acid, Lecithin, Butylene Glycol, Polyvinyl Alcohol, Sodium Lactate, Sodium PCA, PCA, Sorbitan Isostearate, Carbomer, Polysorbate 20, Polysorbate 60, Lactic Acid/Glycolic Acid Copolymer, Hydroxyethyl Acrylate/Sodium Acryloyldimethyl Taurate Copolymer, Xanthan Gum, Isomalt, 1,2-Hexanediol, Caprylyl Glycol, Chlorphenesin, Phenoxyethanol, Tocopherol, Sodium Benzoate, Phenylpropanol, Glyceryl Caprylate, Symphytum Officinale Callus Culture Extract"
    })
    skincare_21a = {
      io: URI.open('https://funelephant-seed.s3.us-west-1.amazonaws.com/Protini_Angled_Shot.png'),
      filename: "Protini_Angled_Shot.png"
    }
    skincare_21b = {
      io: URI.open("https://funelephant-seed.s3.us-west-1.amazonaws.com/21_ProtiniCream_MotionSprite_updated.jpeg"),
      filename: "21_ProtiniCream_MotionSprite_updated.jpeg"
    }
    skincare_21.photos.attach([skincare_21a,skincare_21b]) 
    #---------------
    skincare_22 = Product.create!({
      name: "F-Balm™ Electrolyte Waterfacial Midi", 
      category: "SKIN CARE", 
      price: 18.00,
      desc:"With a blend of barrier-replenishing ingredients, including niacinamide, sodium PCA, plant squalane, five forms of ceramides, omega fatty acids, and powerful antioxidants, F-Balm™ effectively rehydrates hungover, overly parched skin, making it soft and supple. Tiny beads loaded with vitamin F burst during application to deliver extra emollience and soothing hydration.",
      usage: "Apply 4-5 pumps of F-Balm™ as the last step in your nighttime routine. May be worn as an overnight mask. Also can be layered over Virgin Marula Oil for an extra shot of absorbable moisture.",
      ingredients: "Water/Aqua/Eau, Squalane, Propanediol, Niacinamide, Olive Oil Glycereth-8 Esters, Coconut Alkanes, Cocos Nucifera (Coconut) Water, Simmondsia Chinensis (Jojoba) Seed Oil, Ammonium Acryloyldimethyltaurate/VP Copolymer, Glycerin, Mannitol, Sclerocarya Birrea Seed Oil, Sclerocarya Birrea Seed Butter, Sodium PCA, Opuntia Tuna Fruit Extract, Linum Usitatissimum (Linseed) Seed Oil, Sorbitol, Quercetin, Trehalose, Zea Mays (Corn) Oil, Cetyl Alcohol, Sucrose, Creatine, Inositol, Pentylene Glycol, Ferulic Acid, Hydroxytyrosol, Behenic Acid, Linoleic Acid, Cholesterol, Ceramide NS, Ceramide AP, Ceramide EOS, Ceramide NP, Ceramide EOP,  Phospholipids, Sodium Hyaluronate Crosspolymer, Magnesium PCA, Microcrystalline Cellulose, Adenosine, Sodium Hyaluronate, Xanthan Gum, Caprooyl Phytosphingosine, Ascorbyl Palmitate, Hydroxypropyl Methylcellulose"
    })
    skincare_22a = {
      io: URI.open('https://funelephant-seed.s3.us-west-1.amazonaws.com/FBalm_AngledProduct.png'),
      filename: 'FBalm_AngledProduct.png'
    }

    skincare_22b = {
      io: URI.open('https://funelephant-seed.s3.us-west-1.amazonaws.com/22_FBalm_MotionSprite.jpeg'),
      filename: '22_FBalm_MotionSprite.jpeg'
    }

    skincare_22.photos.attach([skincare_22a,skincare_22b]) 
    #---------------
    skincare_23 = Product.create!({
      name: "Protini™ Powerpeptide Resurf Serum", 
      category: "SKIN CARE", 
      price: 82.00,
      desc:"With its ultra-concentrated blend of 11 peptides, Protini™ Powerpeptide Resurf Serum delivers plump, bouncy skin while targeting a dull, uneven complexion. The appearance of fine lines, sun damage, and enlarged pores is improved and glow is restored, while powerful water-boosting ingredients (such as snow mushroom extract, sodium hyaluronate, and sodium PCA) replenish hydration levels. Antioxidant-rich, nonfragrant plant oils and vitamins (tocotrienols, squalane, green tea seed oil, and marula oil) soothe while adding a touch of lightweight moisture to skin.",
      usage:"Shake gently before use. Apply to a clean, dry face, avoiding the eye area. May also be applied to the chest and backs of hands. Follow (or mix) with your choice of Drunk Elephant moisturizer. During the daytime, may also be combined with C-Firma™ Day Serum for added brightening and firming benefits. Follow with Umbra. Protini™ Powerpeptide provides gentle chemical exfoliation on its own, so it is not necessary to also use T.L.C. Framboos™ or Babyfacial on the same day.",
      ingredients: "Water/Aqua/Eau, Glycerin, Lactic Acid, Dicaprylyl Carbonate, Squalane, Sodium Hydroxide, Glycine Max (Soybean) Seed Extract, Sclerocarya Birrea Seed Oil, Camellia Sinensis Seed Oil, Sodium PCA, Caprylic/Capric Triglyceride, Borago Officinalis Seed Oil, Tremella Fuciformis Polysaccharide, Tocotrienols, Sh-Oligopeptide-1, Sh-Oligopeptide-2, Sh-Polypeptide-1, Sh-Polypeptide-9, Sh-Polypeptide-11, Copper Palmitoyl Heptapeptide-14, Heptapeptide-15 Palmitate, Palmitoyl Tetrapeptide-7, Palmitoyl Tripeptide-1, Palmitoyl Tripeptide-38, Palmitoyl Hexapeptide-12, Tripeptide-1, Pyrus Malus (Apple) Fruit Extract, Propanediol, Sodium Hyaluronate, Panthenol, Sodium Hyaluronate Crosspolymer, Sodium Lactate, PCA, Alanine, Arginine, Glycine, Histidine, Isoleucine, Phenylalanine, Proline, Serine, Threonine, Valine, Adenosine, Nymphaea Alba Root Extract, Bacillus/Folic Acid Ferment Filtrate Extract, Symphytum Officinale Callus Culture Extract"
    })
    skincare_23a = {
      io: URI.open('https://funelephant-seed.s3.us-west-1.amazonaws.com/ProtiniSerum_AngledProductShot.png'),
      filename: 'ProtiniSerum_AngledProductShot.png'
    }

    skincare_23b = {
      io: URI.open('https://funelephant-seed.s3.us-west-1.amazonaws.com/23_ProtiniSerum_MotionSprite.jpeg'),
      filename: '23_ProtiniSerum_MotionSprite.jpeg'
    }

    skincare_23.photos.attach([skincare_23a,skincare_23b]) 
    #---------------
    skincare_24 = Product.create!({
      name: "Shaba Complex™ Eye Serum", 
      category: "SKIN CARE", 
      price: 60.00,
      desc:"Shaba Complex™ Eye Serum contains potent doses of black tea ferment, niacinamide, copper peptides, and edelweiss stem cells, which work together to support a smoother, younger look around the eyes. With a unique combination of edelweiss stem cells and niacinamide, Shaba Complex™ helps diminish the appearance of fine lines and wrinkles. The powerful antioxidants in Co-Q10 help prevent premature signs of aging from environmental aggressors while also helping to fade age spots.",
      usage: "Apply under the eye, around the orbital bone, and on the eyelid each morning and night for a refreshing boost to the eye area. ",
      ingredients: "Water/Aqua/Eau, Octyldodecanol, Glycerin, Boron Nitride, Saccharomyces/Xylinum/Black Tea Ferment, Coconut Alkanes, Cetyl Alcohol, Cetearyl Olivate, Sorbitan Olivate, Niacinamide, Copper Tripeptide-1, Leontopodium Alpinum Meristem Cell Culture, Dipeptide-2, Palmitoyl Tripeptide-1, Palmitoyl Tetrapeptide-7, Copper Lysinate/Prolinate, Hesperidin Methyl Chalcone, Chondrus Crispus (Carrageenan), Mangifera Indica (Mango) Seed Butter, Glycine Soja (Soybean) Oil, Hippophae Rhamnoides Oil, Sclerocarya Birrea Seed Oil, Sodium Hyaluronate Crosspolymer, Hydroxyethylcellulose, Coco-Caprylate/Caprate, Steareth-20, Lecithin, Panthenol, N-Hydroxysuccinimide, Ubiquinone, Citric Acid, Thioctic Acid, Tocopherol, Chrysin, Sclerotium Gum, Methylglucoside Phosphate, Xanthan Gum, Potassium Sorbate, Sodium Benzoate, Chlorphenesin, Caprylyl Glycol, Sodium Hydroxide, Phenoxyethanol, Pentylene Glycol, Ethylhexylglycerin"
    })
    skincare_24a = {
      io: URI.open('https://funelephant-seed.s3.us-west-1.amazonaws.com/Shaba_AngledShot.png'),
      filename: 'Shaba_AngledShot.png'
    }
    skincare_24b = {
      io: URI.open('https://funelephant-seed.s3.us-west-1.amazonaws.com/24_Shaba_MotionSprite_update.jpeg'),
      filename: '24_Shaba_MotionSprite_update.jpeg'
    }
    skincare_24.photos.attach([skincare_24a,skincare_24b]) 
    #---------------
    skincare_25 = Product.create!({
      name: "Slaai™ Makeup-Melting Butter Cleanser", 
      category: "SKIN CARE", 
      price: 34.00,
      desc:"Skin-compatible Slaai™ effortlessly removes even water-resistant formulations and is free of PEGs and essential oils. Formulated with antioxidant-rich fruit extracts and oils to help soothe, plus a nourishing African oil blend of marula, baobab, kalahari melon, mongongo, and ximenia, Slaai™ Makeup-Melting Butter Cleanser cleanses and moisturizes without any irritants or sensitizers. Designed to be used on dry skin, Slaai™ removes excess oil, grime, and makeup from skin. Adding water activates Slaai™, transforming it into a milk that rinses cleanly, leaving behind a dewy glow.",
      usage: "",
      ingredients: ""
    })

    skincare_25a = {
      io: URI.open('https://funelephant-seed.s3.us-west-1.amazonaws.com/Slaai_Angled_Shot.png'),
      filename: 'Slaai_Angled_Shot.png'
    }
    skincare_25b = {
      io: URI.open('https://funelephant-seed.s3.us-west-1.amazonaws.com/25_Slaai_MotionSprite.jpeg'),
      filename: "25_Slaai_MotionSprite.jpeg"
    }

    skincare_25.photos.attach([skincare_25a,skincare_25b]) 
    #---------------
    skincare_26= Product.create!({
      name: "Sweet Biome™ Fermented Sake Spray", 
      category: "SKIN CARE", 
      price: 42.00,
      desc:"Sweet Biome’s cocktail of fermented sake extract, kombucha, and hops supplies skin with nutrient-dense substances that restore, soothe, and contribute to a balanced and healthy acid mantle and microbiome. Powerful electrolytes—coconut water and sodium PCA— provide potent antioxidant protection and critical hydration while natural minerals zinc, copper, and calcium gluconate help reduce redness and promote healthy collagen production. Ceramides, vitamin F, and essential amino acids keep skin soft, flexible, and moisturized.",
      usage: "Shake before each use. Mist Sweet Biome™ onto a clean, dry face and follow with your usual daytime or nighttime Drunk Elephant routine. Sweet Biome™ may be used alongside any Drunk Elephant serum, treatment, or moisturizer. Or you can mist on Sweet Biome™ anytime your skin needs a refresher throughout the day.",
      ingredients: "Water/Aqua/Eau, Sodium PCA, Propanediol, Galactomyces Ferment Filtrate, Glycerin, Beta Vulgaris (Beet) Root Extract, Fructooligosaccharides, Saccharomyces/Xylinum/Black Tea Ferment, Cocos Nucifera (Coconut) Fruit Juice, Sclerocarya Birrea Seed Oil, Lactic Acid, Pentylene Glycol, Sodium Hyaluronate Crosspolymer, Zinc Gluconate, Sodium Lactate, Magnesium Aspartate, PCA, Alanine, Arginine,  Glycine, Histidine, Isoleucine, Phenylalanine, Proline, Serine, Threonine, Valine, Aspartic Acid, Calcium Gluconate, Copper Gluconate,  Trehalose, Linoleic Acid, Linolenic Acid, Ceramide AP, Ceramide EOP, Ceramide NP, Phytosphingosine, Cholesterol, Xylitol, Humulus Lupulus  (Hops) Extract, Hyaluronic Acid, Sodium Lauroyl Lactylate, Tapioca Starch, Tetrasodium Glutamate Diacetate, Xanthan Gum, Potassium Lactate, Polysorbate 20, Citric Acid, Carbomer, Phenoxyethanol, Sodium Benzoate, Tocopherol, Sodium Hydroxide, Potassium Sorbate, Ethylhexylglycerin"
    })
    skincare_26a ={
      io: URI.open('https://funelephant-seed.s3.us-west-1.amazonaws.com/SweetBiome_AngledProduct.png'),
      filename: 'SweetBiome_AngledProduct.png'
    }
    skincare_26b = {
      io: URI.open('https://funelephant-seed.s3.us-west-1.amazonaws.com/26_SweetBiome_MotionSprite.jpeg'),
      filename:'26_SweetBiome_MotionSprite.jpeg'
    }
    skincare_26.photos.attach([skincare_26a,skincare_26b]) 
    #---------------
    skincare_27 = Product.create!({
      name: "T.L.C. Framboos™ Glycolic Night Serum", 
      category: "SKIN CARE", 
      price: 134.00,
      desc:"Formulated with our dream team of glycolic, tartaric, lactic, citric, and salicylic acids and blended with raspberry extract and horse chestnut, T.L.C. Framboos™ curbs excess oiliness as it reveals greater clarity and luminosity. It also enhances the performance of other products by clearing the way for maximum absorption. T.L.C. Framboos™ sinks in easily and delivers an effective level of chemical exfoliation without harsh side effects, like dryness or sensitization. Go from a drab complexion to an absolutely luminous one, practically overnight.",
      usage: "In the evening, apply to a clean, dry face (and even to the chest and backs of hands), avoiding the eye area. Mix with Virgin Marula Oil for a dose of moisture and barrier-boosting fatty acids.",
      ingredients: "Water/Aqua/Eau, Glycolic Acid, Butylene Glycol, Glycerin, Sodium Hydroxide, Lactic Acid, Salicylic Acid, Tartaric Acid, Vitis Vinifera (Grape) Juice Extract, Aloe Barbadensis Leaf Juice, Opuntia Ficus-Indica Extract, Aesculus Hippocastanum (Horse Chestnut) Seed Extract, Camellia Sinensis Leaf Extract, Rubus Idaeus (Raspberry) Fruit Extract, Saccharomyces Cerevisiae Extract, Buddleja Davidii Meristem Cell Culture, Sclerocarya Birrea Seed Oil, Sodium Hyaluronate Crosspolymer, Allantoin, Hydroxyethylcellulose, Galactoarabinan, Propanediol, Citric Acid, Tetrasodium Glutamate Diacetate, Xanthan Gum, Hexylene Glycol, Phenoxyethanol, Sodium Benzoate, Caprylyl Glycol, Potassium Sorbate, Pentylene Glycol, Sodium Carbonate, Sodium Chloride, Disodium Phosphate, Sodium Phosphate, Ethylhexylglycerin"
    })

    

    skincare_27a = {
      io: URI.open('https://funelephant-seed.s3.us-west-1.amazonaws.com/TLCFramboos_AngledShortfor.png'),
      filename: 'TLCFramboos_AngledShortfor.pn'
    }
    skincare_27b = {
      io: URI.open('https://funelephant-seed.s3.us-west-1.amazonaws.com/27_TLCFramboos_MotionSprite.jpeg'),
      filename: '27_TLCFramboos_MotionSprite.jpeg'
    }
    skincare_27.photos.attach([skincare_27a,skincare_27b]) ``
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