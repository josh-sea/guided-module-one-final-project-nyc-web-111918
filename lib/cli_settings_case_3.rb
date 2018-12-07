
## settings cases were too long, movied case 3 to new method
def settings_menu_case_3
  puts ""
  puts "Do you want to update an (1) actor or a (2) movie?"
  input = gets_user_input
  if input == "1"
    puts "You selected actor if this is incorrect type back."
    puts "Otherwise please enter name, birthday, or hometown to update that information"
    input_back = gets_user_input.downcase
    if input_back == "back"
      settings_menu
    elsif input_back == "name"
      puts "What is the old name you want to correct?"
      old_name = gets_user_input
      old = Actor.inst_method(old_name)
      sleep 0.5
      puts "What is the new name you would like to correct it to?"
      new_name = gets_user_input
      old.update(name: new_name)
      new = Actor.inst_method(new_name)
      puts "All done! Let me show you the new information."
      sleep 0.5
      puts "Their name is:"
      puts new.name
      sleep 0.5
      puts "Their birthday is:"
      puts new.birthday
      sleep 0.5
      puts "Their hometown is:"
      puts new.hometown
      sleep 0.5
      follow_up
    elsif input_back == "birthday"
      puts "What is the actor's name whose birthday your want to update?"
      old_name = gets_user_input
      old = Actor.inst_method(old_name)
      sleep 0.5
      puts "What is the new birthday you would like to correct it to?"
      puts "PLEASE USE YYYY-MM-DD"
      new_bday = gets_user_input
      old.update(birthday: new_bday)
      puts "All done! Let me show you the new information."
      sleep 0.5
      puts "Their name is:"
      puts old.name
      sleep 0.5
      puts "Their birthday is:"
      puts old.birthday
      sleep 0.5
      puts "Their hometown is:"
      puts old.hometown
      sleep 0.5
      follow_up
    elsif input_back == "hometown"
      puts "What is the actor's name whose hometown your want to update?"
      old_name = gets_user_input
      sleep 0.5
      puts "What is the new hometown you would like to correct it to?"
      new_hometown = gets_user_input
      Actor.find(Actor.actor_id_selector(old_name)).update(hometown: new_hometown)
      puts "All done! Let me show you the new information."
      sleep 0.5
      puts "Their name is:"
      puts Actor.find(Actor.actor_id_selector(old_name)).name
      sleep 0.5
      puts "Their birthday is:"
      puts Actor.find(Actor.actor_id_selector(old_name)).birthday
      sleep 0.5
      puts "Their hometown is:"
      puts Actor.find(Actor.actor_id_selector(old_name)).hometown
      sleep 0.5
      follow_up
    else
      puts "No valid informtation type selected"
      settings_menu
    end
  elsif input == "2"
    puts "You selected movie if this is incorrect type back."
    puts "Otherwise please enter the title or year to update that information"
    input_back = gets_user_input.downcase
    if input_back =="back"
      settings_menu
    elsif input_back == "title"
      puts "What is the old title you want to correct?"
      old_title = gets_user_input
      sleep 0.5
      puts "What is the new title you would like to correct it to?"
      new_title = gets_user_input
      Movie.find(Movie.movie_id_selector(old_title)).update(title: new_title)
      puts "All done! Let me show you the new information."
      sleep 0.5
      puts "The title is:"
      puts Movie.find(Movie.movie_id_selector(new_title)).title
      sleep 0.5
      puts "The year it was released is:"
      puts Movie.find(Movie.movie_id_selector(new_title)).year
      sleep 0.5
      follow_up
    elsif input_back == "year"
      puts "What is the title of the movie you want to correct?"
      old_title = gets_user_input
      sleep 0.5
      puts "What is the year you would like to correct the movie to have been released in?"
      new_year = gets_user_input.to_i
      Movie.find(Movie.movie_id_selector(old_title)).update(year: new_year)
      puts "All done! Let me show you the new information."
      sleep 0.5
      puts "The title is:"
      puts Movie.find(Movie.movie_id_selector(old_title)).title
      sleep 0.5
      puts "The year it was released is:"
      puts Movie.find(Movie.movie_id_selector(old_title)).year
      sleep 0.5
      follow_up
    else
      puts "No valid informtation type selected"
      settings_menu
    end
    puts "You selected movie if this is incorrect type back."
    input_back = gets_user_input
    if input_back == "back"
      settings_menu
    end
  else
    puts "You did not select an option, type 1 for actor or 2 for movie"
    settings_menu
  end
end
