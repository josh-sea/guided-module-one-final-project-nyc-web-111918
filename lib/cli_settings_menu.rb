#settings case

tp.set Actor, :name, :birthday, :hometown
tp.set Movie, :title, :year

#########################
def settings_case
  ###CUD Operations... (R is in main menu)
  input = gets_user_input
  case input
  when "1" #new movie
    puts ""
    puts "You need to know the movie title and the year it was released"
    puts "What is the movie title?"
    movie_input = gets_user_input
    sleep 0.5
    puts "What year was the movie released to theaters?"
    year_input = gets_user_input.to_i
    sleep 0.5
    puts "You entered #{movie_input} for the movie title and #{year_input} for the release year"
    puts "If that is not correct please type exit now or type anything else to continue"
    input = gets_user_input
    if input == "exit"
      puts "cancelled!"
      sleep 0.5
      system("clear")
      settings_menu
    else
      Movie.create(title: movie_input,year: year_input)
      sleep 1.5
      system("clear")
      follow_up
    end
  when "2" #new actor
    puts ""
    puts "You need to know the actor name, birthday, and hometown.\nIf you are unsure of any item leave it blank,\nor if you mess anything up,\n you can add or fix it later!"
    sleep 0.5
    puts "What is the actor's name?"
    name_input = gets_user_input
    sleep 0.5
    puts "What is the actor's birthday?\n\n PLEASE USE YYYY-MM-DD."
    birthday_input = gets_user_input
    sleep 0.5
    puts "What is the actor's hometown?"
    hometown_input = gets_user_input
    sleep 0.5
    puts "You entered #{name_input} for the actor name, #{birthday_input} for the birthday, and #{hometown_input} for their hometown."
    puts "If that is not correct please type exit now or type anything else to continue"
    input = gets_user_input
    if input == "exit"
      puts "cancelled!"
      sleep 0.5
      system("clear")
      settings_menu
    else
      Actor.create(name: name_input,birthday: birthday_input, hometown: hometown_input)
      sleep 1.5
      system("clear")
      follow_up
    end
  when "3" #update
    settings_menu_case_3
  when "4" #new Work (a actormovie connection)
    puts "If you would like to make a new connection between movie and actor\nyou will need the movie title and actor name.\n\n"
    sleep 1
    puts "If you didn't mean to make this selection type exit to quit\n\nOR\n\nWhat is the movie title?"
    sleep 0.5
    movie_input = gets_user_input
    if movie_input == "exit"
      sleep 1
      system("clear")
      menu
      settings_menu
    else
      mov = Movie.inst_method(movie_input).id
      puts "Thank you!"
      sleep 0.5
      puts "What is the actors name?\n"
      sleep 0.5
      actor_input = gets_user_input
      act = Actor.inst_method(actor_input).id
      sleep 0.5
      puts "Awesome, thank you, magic is happening\n"
      puts "You entered #{movie_input} for movie title and #{actor_input} for actor name, are these correct? (y/n)"
      bool = gets_user_input
      if bool == "y" || bool == "yes"
        if Work.find(mov).actor_id == act
          puts "This connection already exists, trust me I checked my database"
          sleep 0.5
          puts "In fact, here it is!"
          sleep 1
          puts Work.find_by(movie_id: mov, actor_id: act)
          sleep 1
          puts "I know this looks funny but it is where I am storing it in my memory."
          sleep 1
          puts "See, I told you to trust me."
          c = Artii::Base.new
          puts c.asciify('YAAAAY')
          sleep 1
          system("clear")
          settings_menu
        else
          Work.create(movie_id: mov, actor_id: act)
          sleep 1
          puts "Congratulations you did it!"
          puts "The actors in #{Movie.find(mov).title} are:\n
          #{Movie.find(mov).actors.map{|actor| actor.name}.join(", ")}"
          sleep 1.5
          system("clear")
          follow_up
        end
      elsif bool == "n" || bool == "no"
        sleep 0.5
        system("clear")
        settings_menu
      else
        puts "you didn't make a yes or no selection, please try again"
        sleep 1
        system("clear")
        settings_case
      end
    end
  when "5" #delete movie or actor instance
    puts "You selected delete, this action cannot be undone,\nhowever you can add a movie or actor back through the settings menu."
    sleep 0.5
    puts "Do you want to delete a movie or actor?"
    movie_or_actor = gets_user_input.downcase
    sleep 0.5
    puts "You selected #{movie_or_actor}\n"
    puts "If this is incorrect please type back\n\nOR\n\nEnter the the movie title or actor name you want to delete."
    delete_input = gets_user_input
    if delete_input == "back"
      sleep 1
      system("clear")
      settings_menu
    elsif movie_or_actor == "movie" || movie_or_actor == "actor"
      if movie_or_actor == "movie"
        Movie.destroy(Movie.inst_method(delete_input).id)
      else
        Actor.destroy(Actor.inst_method(delete_input).id)
      end
    else
      puts "You did not enter a valid command, please start over"
      sleep 1
      system("clear")
      settings_menu
    end
    sleep 1
    puts "Congratulations you deleted #{delete_input}, I hope you're happier now..."
    sleep 2
    puts "Seriously, I really am."
    puts "SERIOSULY"
    sleep 1
    b = Artii::Base.new
    puts b.asciify('SERIOUSLY!!!')
    sleep 1.5
    system("clear")
    follow_up
  when "back" #back to main menu
    sleep 1
    system("clear")
    menu
    main_menu
  else #bad input
    puts "You didn't make a correct selection, \ntype back to return to the main menu \nor type a number selection"
    sleep 1
    system("clear")
    settings_case
  end
end
#########################
