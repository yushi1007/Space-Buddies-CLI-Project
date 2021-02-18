class Interface
  # here will be your CLI!
  # it is not an AR class so you need to add attr

  attr_reader :prompt
  attr_accessor :user

  def initialize
  @prompt = TTY::Prompt.new
  end

  def welcome
    play_music
    sleep (1.5)
    Logo.go
    sleep(2)
    puts "Welcome to Space Buddies🌟".colorize(:blue)
    sleep(0.5)
    log_in
  end

  def log_in
    prompt.select("do you wanna meet some space buddies???") do |menu|
      menu.choice "log in", -> {log_in_helper}
      menu.choice "sign up", -> {sign_up_helper}
      menu.choice "exit", -> {exit_helper}
    end
  end

  def log_in_helper
    name = prompt.ask("enter nickname")
    password = prompt.ask("enter secret code")
    if User.find_by(name: name, password: password)
      self.user = User.find_by(name: name, password: password)
      puts "yay we're so glad you're back!! #{self.user.name} weeee!"
      stop_music
      breed_page 
    else
      puts "oops! wrong username or password! the space buddies are waiting for you 🪲".colorize(:red).on_blue.underline
      sleep(1)
      log_in
  end
end

def sign_up_helper
  system 'clear'
  name = prompt.ask("enter nickname")
  while User.find_by(name: name)
     puts "oh no! someone already has this nickname! boooo!"
     name = prompt.ask("enter nickname") 
end
password = prompt.ask("enter secret code")
self.user = User.create(name: name, password: password)
sleep(3)
breed_page
end

def exit_helper
  system 'clear'
  puts "may the wind under your wings bear you where the sun sails and the moon walks..."
  sleep(3)
  stop_music
  Logo.go  
  sleep(2)
end

def breed_page
  system 'clear'
    prompt.select("which kind of breed do you want to meet?") do |menu|
        menu.choice "Robot".colorize(:red), -> {change_user_breed(1)}
        menu.choice "Fluffy".colorize(:light_blue), -> {change_user_breed(2)}
        menu.choice "Buggy".colorize(:green), -> {change_user_breed(3)}
        menu.choice "Ghost".colorize(:yellow), -> {change_user_breed(4)}
        menu.choice "Unknown".blue.on_red.blink, -> {unknown_helper}
    end
end

def change_user_breed(breed)
  system 'clear'
  # binding.pry
  self.user.user_breeds.first.update(breed_id: breed)
  main_menu
end

def main_menu
  system 'clear'
  prompt.select("main menu") do |menu|
      menu.choice "see all pets", -> {see_pets}
      menu.choice "surprise me", -> {random_pet}
      menu.choice "change breed", -> {breed_page}
      menu.choice "delete account", -> {delete_account}
      menu.choice "log Off", -> {log_off}
  end
end

def log_off
  system 'clear'
  puts "see you sooooon!" 
  sleep (1)
  welcome
end 

def delete_account
  system 'clear'
    current_user = User.find(self.user.id)
    current_user.delete
    puts "your account has been deleted rip </3".colorize(:red).on_blue.underline
    sleep(3)
    welcome
end

def see_pets
  system 'clear'
  pet = Pet.where(breed_id: self.user.user_breeds.first.breed_id)
  chosen_pet = prompt.select( "which space buddy do you want to meet?", pet)
  puts chosen_pet.name
  puts ""
  puts chosen_pet.bio 
  prompt.select(" Select from options") do |menu|
      menu.choice "i want to meet another pet", -> {see_pets}
      menu.choice "go back to main menu", -> {main_menu}
  end
end

def random_pet
  system 'clear'
  random = Pet.where(breed_id: self.user.user_breeds.first.breed_id)
  new_random = random.sample 
  puts new_random.name 
  puts ""
  puts new_random.bio
  prompt.select(" Select from options") do |menu|
    menu.choice "i want to meet another pet", -> {see_pets}
    menu.choice "go back to main menu", -> {main_menu}
  end
end 

def unknown_helper
  system 'clear'
  puts ".......oooOoOoOooo............".colorize(:red)
  sleep(2)
  puts "...no one knows who this pet is......".colorize(:red)
  sleep(2)
  puts "....perhaps they'll reveal themselves one day....".colorize(:red)
  sleep(2)
  puts ".................we can only hope.....................".colorize(:red).on_blue.underline
  sleep(4)
  prompt.select(" Select from options") do |menu|
    menu.choice "i want to meet another pet", -> {see_pets}
    menu.choice "go back to main menu", -> {main_menu}
  end
end

private


def play_music
  pid = fork{exec 'afplay', "internet lullaby.mp3"}
end

def stop_music
  pid = fork{system 'killall', 'afplay'}
end
                                                                                                                
                                                                                                                                                                                                                                                                          
  
end
