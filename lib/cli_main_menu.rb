
tp.set Actor, :name, :birthday, :hometown
tp.set Movie, :title, :year
tp.set Director, :name, :age

def follow_up
  puts ""
  puts "~_~_~_~_~_~_~_~_~_~_~_~_~_~_~_~_~_~_~_~_~_~_~_~_~_~_~"
  puts ""
  puts "Is there anything else you need? Y/N"
  puts ""
  puts "~_~_~_~_~_~_~_~_~_~_~_~_~_~_~_~_~_~_~_~_~_~_~_~_~_~_~"
  puts ""
  input = gets_user_input.downcase.strip
  puts ""
  puts ""
  if input == "y" || input == "yes"
    menu
    puts ""
    puts ""
    main_menu
  elsif input == "n" || input == "no"
    exit_app
  else
    puts "You didn't enter a valid response, try y or n"
    menu
  end
  # binding.pry
  # input
end
#########################
def main_menu
  ### Reading database methods
    input = gets_user_input
    sleep 0.5
    # binding.pry
    puts ""
  case input
  when "1" #Get  list of all actors
    tp Actor.all
    #puts (Actor.all.map{|actor| actor.name})
    sleep 1.5
    system("clear")
    follow_up
  when "2" #Get a list of all movies
    tp Movie.all
    #puts (Movie.all.map{|movie| movie.title})
    sleep 1.5
    system("clear")
    follow_up
  when "3" #Find a Movie release year
    puts "Please type the movie you are looking for."
    puts ""
    input = gets_user_input
    mov = Movie.inst_method(input)
    puts "The movie was released in:"
    puts mov.year
    sleep 1.5
    system("clear")
    follow_up
  when "4" #Find all the actors with the same hometown in a movie
    puts "Please type the movie you are looking for."
    puts ""
    input = gets_user_input
    mov = Movie.inst_method(input)
    if mov.actors.length == 0
      puts "This film has no known actors! If you know one you can add them in settings."
      sleep 1.5
      system("clear")
      follow_up
    else
      puts mov.actors_with_same_hometown.map{|hometown, names| "#{hometown}:\n#{names.join("\n")}\n\n"}
      sleep 1.5
      system("clear")
      follow_up
    end
  when "5" #Find the busiest year for an actor
    puts "Please type the actor you are looking for."
    puts ""
    input = gets_user_input
    act = Actor.inst_method(input)
    if act.movies.length == 0
      puts "actor has no movies"
      sleep 1.5
      system("clear")
      follow_up
    else
      puts act.year_with_most_movies
      sleep 1.5
      system("clear")
      follow_up
    end
  when "6" #Find what movies an actor was in
    puts "Please type the actor you are looking for."
    puts ""
    input = gets_user_input
    ad = Actor.inst_method(input).movies
    ###if loop added because if downcoasing method returns nothing, running .movies causes error
    if ad.length == 0
      puts "actor has no movies"
      sleep 1.5
      system("clear")
      follow_up
    else
      puts ad.map {|movie| movie.title}
      sleep 1.5
      system("clear")
      follow_up
    end
  when "7" #Find what actors are in a movie
    puts "Please type the movie you are looking for."
    puts ""
    input = gets_user_input
    mov = Movie.inst_method(input)
    if mov.actors.length == 0
      puts "This film has no known actors! If you know one you can add them in settings."
      sleep 1.5
      system("clear")
      follow_up
    else
      puts mov.actors.map {|actor| actor.name}
      sleep 1.5
      system("clear")
      follow_up
    end
  when "8" #Find an actors birthday!
    puts "Please type the actor you are looking for."
    puts ""
    input = gets_user_input
    act = Actor.inst_method(input)
    # puts Actor.find(Actor.actor_id_selector(input)).birthday
    puts act.birthday
    puts "Happy Birthday #{act.name}!!!"
    sleep 1.5
    system("clear")
    follow_up
  when "9" #Find an actors info
    puts "Please type the actor you are looking for."
    puts ""
    input = gets_user_input
    # ASSIGN ID TO A NEW VARIABLE
    act = Actor.inst_method(input)
    puts "Their name is:"
    puts act.name
    sleep 0.5
    puts "Their birthday is:"
    puts act.birthday
    sleep 0.5
    puts "Their hometown is:"
    puts act.hometown
    sleep 1.5
    system("clear")
    follow_up
  when "10" #Find a movies info
    puts "Please type the movie you are looking for."
    puts ""
    input = gets_user_input
    mov = Movie.inst_method(input)
    puts "Its title is:"
    puts mov.title
    sleep 0.5
    puts "It was released in:"
    puts mov.year
    sleep 0.5
    puts "Its director is:"
    puts mov.director.name
    sleep 1.5
    system("clear")
    follow_up
  when "11" #Find all directors
    tp Director.all
    sleep 1.5
    system("clear")
    follow_up
  when "12" #Find all the movies a director has made
    puts "what is the director's name?"
    input = gets_user_input
    dm = Director.inst_method(input)
    if dm.movies.length == 0
      puts "This director has no known movies yet, you can add them in settings if you would like to!"
      sleep 1.5
      system("clear")
      follow_up
    else
      puts dm.movies.map{|movie| movie.title}
      sleep 1.5
      system("clear")
      follow_up
    end
  when "13" #Find all the actors a director has worked with
    puts "what is the director's name?"
    input = gets_user_input
    dm = Director.inst_method(input)
    if dm.movies.length == 0
      puts "This director has no known movies yet, so, no actors; you can add them in settings if you would like to!"
      sleep 1.5
      system("clear")
      follow_up
    else
      puts dm.actors.map{|act| act.name}
      sleep 1.5
      system("clear")
      follow_up
    end
  when "settings" #Type settings to make changes
    settings_menu
  when "exit" #Type exit to exit at anytime
    exit_app
  else
    puts "You didn't pick a valid input, try just a number or 'exit'"
    main_menu
  end
end
#########################
