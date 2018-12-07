
require 'pry'
class Actor < ActiveRecord::Base
  has_many :movies, through: :works
  has_many :directors, through: :movies
  has_many :works

  def self.inst_method(input_name)
    actor = self.all.select{|actor| actor.name.downcase == input_name.downcase}
    # binding.pry
    actor[0].multiple_matches_sort(actor)
  end

  def multiple_matches_sort(array)
    if array.length > 1
      # binding.pry
      puts "There are #{array.length} actors matching that name."
      puts "Please type the number corresponding to the correct actor you are looking for"
      puts array.map{|array_i| "#{array.index(array_i)+1}. name: #{array_i.name} birthday: #{array_i.birthday} hometown: #{array_i.hometown}"}
      input = gets_user_input.to_i
      array[input-1]
    else
      array[0]
    end
  end

  def all_actors_most_busy_year
    busy_hash = {}
    Actor.all.each do |actor|
      busy_hash[actor.name] = actor.year_with_most_movies
    end
    busy_hash
  end

  def self.all_movies_actors_are_in
    Actor.all.map{|actor|actor.movies}
  end

  def self.downcase_actors
    actor_hash = {}
    Actor.all.map{|actor| actor_hash[actor.id] = actor.name.downcase}
    actor_hash
  end
  def self.select_downcase_actors(actor)
    actor_select = Actor.downcase_actors.select do |id, actor_dc|
      actor_dc == actor.downcase
    end
    #finds a movie instance by key basedon input movie not case sensitive
    Actor.find(actor_select.keys)[0]
  end
  def self.actor_id_selector(actor)
    self.select_downcase_actors(actor).id
  end

  def year_with_most_movies
    year = {}
    movies.map do |movie|
      if year[movie.year] == nil
        year[movie.year] = 1
      else
        year[movie.year] += 1
      end
    end
    sorted = year.sort_by{|year, count| count}[-1][0]
  end

  def self.actors_with_in_mulitple_movies
    self.all.select {|actor| actor.movies.length > 1}.map{|actor| actor.name}
  end

  def partial_actor_search
    #find an actor with partial string
  end
end #End of Actor Class
