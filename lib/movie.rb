require 'pry'
class Movie < ActiveRecord::Base
  has_many :actors, through: :works
  has_many :works
  belongs_to :director

  def self.inst_method(input_title)
    movie = self.all.select{|movie| movie.title.downcase == input_title.downcase}
    movie[0].multiple_matches_sort(movie)
  end
  def multiple_matches_sort(array)
    if array.length > 1
      puts "There are #{array.length} movies matching that title."
      puts "Please type the number corresponding to the correct movie you are looking for"
      puts array.map{|array_i| "#{array.index(array_i)+1}. title: #{array_i.title} year: #{array_i.year}, diretor: #{array_i.director.name}"}
      input = gets_user_input.to_i
      array[input-1]
    else
      array[0]
    end
  end

  # def movie_release_year(movie)
  #   movie_select = Movie.downcase_movies.select do |id, movie_dc|
  #     # binding.pry
  #     movie_dc == movie.downcase
  #   end
  #   Movie.find(movie_select.keys)[0].year
  # end

  def self.downcase_movies
    movie_hash = {}
    Movie.all.map{|movie| movie_hash[movie.id] = movie.title.downcase}
    movie_hash
  end
  def self.select_downcase_movie(movie)
    movie_select = Movie.downcase_movies.select do |id, movie_dc|
      movie_dc == movie.downcase
    end
    #finds a movie instance by key basedon input movie not case sensitive
    Movie.find(movie_select.keys)[0]
  end
  def self.movie_id_selector(movie)
    Movie.select_downcase_movie(movie).id
  end

  def average_actor_age
    actors.map{|actor| actor.age}.reduce(0){|sum, element| sum + element} / actors.length
  end

  def actors_with_same_hometown
    hometown = {}
    actors.each do |actor|
      if hometown[actor.hometown] == nil
        hometown[actor.hometown] = [actor.name]
      else
        hometown[actor.hometown] << actor.name
      end
    end
    hometown
  end

  def movie_counter
    hash = {}
    Movie.all.map do |movie|
      if hash[movie.title] == nil
        hash[movie.title] = [movie.year]
      else
        hash[movie.title] << movie.year
      end
    end
    hash
  end



end
