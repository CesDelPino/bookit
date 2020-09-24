require_relative "bookit/version"
require_relative "options"

module Bookit
  class Error < StandardError; 
  end
  # Your code goes here...
end

def help_menu(option)
  case 
  when option == "-h" || "--help" || "help"
    puts "this is the help menu"
    exit
  else
    puts "That is an unknown command, you can try the following......"
    exit
  end

end


if ARGV.empty?
  puts "Welcome to the bookit app"
  caller = OpeningOptions.new
  caller.openining_choice
elsif
  option = ARGV[0]
  ARGV.clear
  puts "You have selected #{option}"
  help_menu(option)
else
end


