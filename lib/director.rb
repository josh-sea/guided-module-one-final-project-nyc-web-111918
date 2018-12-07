class Director < ActiveRecord::Base
  has_many :movies
  has_many :actors, through: :movies


def self.inst_method(input_name)
  director = self.all.select{|director| director.name.downcase == input_name.downcase}
  if director.length > 1
    puts "There are #{director.length} directors matching that name."
    puts "Please type the number corresponding to the correct director you are looking for"
    puts director.map{|director_i| "#{director.index(director_i)+1}. name: #{director_i.name} age: #{director_i.age}"}
    input = gets_user_input.to_i
    if director[input-1].movies.length == 0
      puts "That director has not done anything yet."
      director
      follow_up
    else
      director[input-1]
    end
  else
    director
  end
end

end
