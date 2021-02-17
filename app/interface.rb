class Interface
  # here will be your CLI!
  # it is not an AR class so you need to add attr

  attr_reader :prompt
  attr_accessor :user

  def initialize
  @prompt = TTY::Prompt.new
  end

  def welcome
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
      breed_page 
    else
      puts "oops! wrong username or password! the space buddies are waiting for you 🪲"
      sleep(1)
      log_in
  end
end

def sign_up_helper
  name = prompt.ask("enter nickname")
  while User.find_by(name: name)
     puts "oh no! someone already has this nickname! boooo!"
     name = prompt.ask("enter nickname") 
end
password = prompt.ask("enter secret code")
self.user = User.create(name: name, password: password)
breed_page
end

def exit_helper
  puts "may the wind under your wings bear you where the sun sails and the moon walks"
  sleep(3)
  log_in  
end

  private

  
end
