require "colorize"
require "ruby_figlet"
require_relative "bookit/version"
require_relative "options"

PROMPT = TTY::Prompt.new

# module Bookit
#   class Error < StandardError;
#   end
#   # Your code goes here...
# end

# creating a help menu if an ARGV value is passed on start

def help_menu(option)
  case option
  when "-h" || "--help" || "help"
    puts "this is the help menu"
    exit
  when "else"
    puts "this is is different option"
    exit
  else
    puts "That is an unknown command, you can try the following......"
    exit
  end
end

# checking for ARG value and routing to opening_options or help statement
if ARGV.empty?
  puts "Welcome to the bookit app for".colorize(:red)
  using RubyFiglet
  My_restaurant = "My Restaurant"
  My_restaurant.art!("roman")
  puts My_restaurant.colorize(:blue)
  caller = OpeningOptions.new
  caller.opening_choice
elsif option = ARGV[0]
  ARGV.clear
  puts "You have selected #{option}".colorize(:red)
  help_menu(option)
else
end
