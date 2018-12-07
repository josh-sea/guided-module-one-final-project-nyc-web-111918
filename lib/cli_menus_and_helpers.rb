
def greet
  a = Artii::Base.new
  puts a.asciify('Welcome to BigScreen!')
  puts "The command line solution to your Movie and Movie Star needs!"
  puts ""
  puts "We can help you find who is in what and more!"
  puts ""
  puts "~_~_~_~_~_~_~_~_~_~_~_~_~_~_~_~_~_~_~_~_~_~_~_~_~_~_~"
  puts ""
  puts "1.   Get  list of all actors:"
  puts "2.   Get a list of all movies:"
  puts "3.   Find a Movie release year:"
  puts "4.   Find all the actors with the same hometown in a movie:"
  puts "5.   Find the busiest year for an actor:"
  puts "6.   Find what movies an actor was in:"
  puts "7.   Find what actors are in a movie:"
  puts "8.   Find an actors birthday!"
  puts "9.   Find an actors info"
  puts "10.  Find a movies info"
  puts "11.  Find all the directors"
  puts "12.  Find all the movies a director has made"
  puts "13.  Find all the actors a director has worked with"
  puts "Type settings to make changes"
  puts "Type exit to exit at anytime"
  puts ""
  puts "~_~_~_~_~_~_~_~_~_~_~_~_~_~_~_~_~_~_~_~_~_~_~_~_~_~_~"
end
#########################
def menu
  puts ""
  puts "~_~_~_~_~_~_~_~_~_~_~_~_~_~_~_~_~_~_~_~_~_~_~_~_~_~_~"
  puts "1.   Get  list of all actors:"
  puts "2.   Get a list of all movies:"
  puts "3.   Find a Movie release year:"
  puts "4.   Find all the actors with the same hometown in a movie:"
  puts "5.   Find the busiest year for an actor:"
  puts "6.   Find what movies an actor was in:"
  puts "7.   Find what actors are in a movie:"
  puts "8.   Find an actors birthday!"
  puts "9.   Find an actors info"
  puts "10.  Find a movies info"
  puts "11.  Find all the directors"
  puts "12.  Find all the movies a director has made"
  puts "13.  Find all the actors a director has worked with"
  puts "Type settings to make changes"
  puts "Type exit to exit at anytime"
  puts ""
  puts "~_~_~_~_~_~_~_~_~_~_~_~_~_~_~_~_~_~_~_~_~_~_~_~_~_~_~"
end
#########################
def settings_menu
  puts ""
  puts "~_~_~_~_~_~_~_~_~_~_~_~_~_~_~_~_~_~_~_~_~_~_~_~_~_~_~"
  puts ""
  puts "1. Add a new movie"
  puts "2. Add a new actor"
  puts "3. Change a movie or actor info"
  puts "4. Connect a movie and actor"
  puts "5. Delete a movie or actor"
  puts "Type back to return to the main menu"
  puts ""
  puts "~_~_~_~_~_~_~_~_~_~_~_~_~_~_~_~_~_~_~_~_~_~_~_~_~_~_~"
  puts ""
  settings_case
end
#########################
def gets_user_input
  gets.chomp.strip
  #what could we put here to allow a user to type a response?
end
#########################
def exit_app
  puts "Thank you for using..."
  e = Artii::Base.new
  puts e.asciify('                                          BigScreen')
end
##########################
