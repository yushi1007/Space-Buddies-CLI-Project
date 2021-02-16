# THIS SEED FILE NEEDS TO BE ENTIRELY REPLACED -- I'M LEAVING CODE FOR YOUR REFERENCE ONLY!

User.destroy_all
UserPet.destroy_all
Pet.destroy_all
Breed.destroy_all

User.reset_pk_sequence
UserPet.reset_pk_sequence
Pet.reset_pk_sequence
Breed.reset_pk_sequence

###### USER ######

greenguy = User.create(name: "Green Guy" , password: "alienl0ve")
yu = User.create(name: "Yu", password: "1234")
thanos = User.create(name: "Thanos" , password: "badguy123")
rocket = User.create(name: "Rocket" , password: "4321")
shootingstar = User.create(name: "Shooting Star" , password: "shinebright")

###### BREED ######

robot = Breed.create(name: "Robot")
fluffy = Breed.create(name: "Fluffy")
buggy = Breed.create(name: "Buggy")
ghost = Breed.create(name: "Ghost")
unknown = Breed.create(name: "Unknown")

###### PET ######

k9 = Pet.create(name: "K9", breed_id: 1, bio: "Professor Frederick Marius, who invented the first K9 in the year 5000 while working on the asteroid K4067, described him as my best friend and constant companion.") 

dog_the_robot = Pet.create(name: "Dog the Robot", breed_id: 1, bio: "Number one go-to robotic buddy who helps when your path is blocked by other dimensional beings or just wants to play fetch with your grav gun.") 

muffit = Pet.create(name: "Muffit", breed_id: 1, bio: "A daggit hybrid, a canine-like robotic drone used as a domesticated pet, watch animal, or tracker.") 

gir = Pet.create(name: "Gir", breed_id: 1, bio: "Mentally disturbed robot helper. Really cute, but he’s amoral, evil and would gladly watch you die a fiery death while bursting into a fit of giggles") 

snarf = Pet.create(name: "Snarf", breed_id: 2, bio: "Alien cat that ends every sentence with a “SNARF!” sound.") 

gizmo = Pet.create(name: "Gizmo", breed_id: 2, bio: "Cute, kind, loveable, adorable Mogwai. Has a huge emotional range, and is adept with weapons and electrical devices.") 

ein = Pet.create(name: "Ein", breed_id: 2, bio: "His intelligence was greatly enhanced by a research facility. What exactly was done to him was not widely known.") 

tribble = Pet.create(name: "Tribble", breed_id: 2, bio: "Small, furry, gentle, attractive, and slow-moving but rapidly reproducing lovable species.") 

queequeg = Pet.create(name: "Queequeg", breed_id: 2, bio: "A Pomeranian who first belonged to Mrs. Lowe before being taken into the care of FBI Special Agent Dana Scully.") 

bronx = Pet.create(name: "Bronx", breed_id: 3, bio: "A gargoyle beast, and founding member of the Manhattan Clan. A fierce and formidable fighter when there is an emergency, a loyal friend, and a very good judge of character.") 

lamarr = Pet.create(name: "Lamarr", breed_id: 3, bio: "A headcrab who has been debeaked, preventing her from latching onto (coupling with) and controlling a host.") 

selacious_crumb = Pet.create(name: "Selacious Crumb", breed_id: 3, bio: "A kowakian monkey-lizard who worked as a jester in the court of the crime lord Jabba Desilijic Tiure during the Galactic Civil War. Known for his shrill laughter.") 

slimer = Pet.create(name: "Slimer", breed_id: 4, bio: "A green ghost that terrorizes the Ghostbusters team by covering everything in slime.") 

error = Pet.create(name: "Error", breed_id: 5, bio: "Unknown")

###### USERPET ######

UserPet.create(user_id: 5, pet_id: 1)
UserPet.create(user_id: 2, pet_id: 6)
UserPet.create(user_id: 3, pet_id: 5)
UserPet.create(user_id: 4, pet_id: 7)
UserPet.create(user_id: 1, pet_id: 2)

puts "💫☆✪☆☆⚛︎✰✰✴︎💫"




########### different ways to write your seeds ############

# # 2. Mass create -- in order to connect them later IN SEEDS (not through the app) you'll need to find their id
# ## a. by passing an array of hashes:
# Plant.create([
#     {name: "Corn Tree", bought: 20170203, color: "green"},
#     {name: "Prayer plant", bought: 20190815, color: "purple"},
#     {name: "Cactus", bought: 20200110, color: "ugly green"}
# ])
# ## b. by interating over an array of hashes:
# plants = [{name: "Elephant bush", bought: 20180908, color: "green"},
#     {name: "Photos", bought: 20170910, color: "green"},
#     {name: "Dragon tree", bought: 20170910, color: "green"},
#     {name: "Snake plant", bought: 20170910, color: "dark green"},
#     {name: "polka dot plant", bought: 20170915, color: "pink and green"},
#     {name: "Cactus", bought: 20200517, color: "green"}]

# plants.each{|hash| Plant.create(hash)}

# # 3. Use Faker and mass create
# ## step 1: write a method that creates a person
# def create_person
#     free = ["mornings", "evenings", "always", "afternoons", "weekends", "none"].sample

#     person = Person.create(
#         name: Faker::Movies::HitchhikersGuideToTheGalaxy.character,
#         free_time: free,
#         age: rand(11...70)
#     )
# end

# ## step 2: write a method that creates a joiner
# def create_joiners(person)
#     plants_number = rand(1..4)
#     plants_number.times do 
#         PlantParenthood.create(
#             plant_id: Plant.all.sample.id, 
#             person_id: person.id, 
#             affection: rand(101), 
#             favorite?: [true, false].sample
#         )
#     end
# end

# ## step 3: invoke creating joiners by passing in an instance of a person
# 10.times do     
#     create_joiners(create_person)
#     ##### ALTERNATIVE:
#     # person = create_person
#     # create_joiners(person)
# end

# indoor = Category.create(name: "indoors")

# Plant.update(category_id: indoor.id)


  