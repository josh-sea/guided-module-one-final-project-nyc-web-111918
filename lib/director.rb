class Director < ActiveRecord::Base
  has_many :movies
  has_many :actors, through: :movies

def self.inst_method(input_name)
  dir = self.all.select{|dir| dir.name.downcase == input_name.downcase}
  dir[0].multiple_matches_sort(dir)
end
def multiple_matches_sort(array)
  if array.length > 1
    puts "There are #{array.length} directors matching that title."
    puts "Please type the number corresponding to the correct director you are looking for."
    puts array.map{|array_i| "#{array.index(array_i)+1}. name: #{array_i.name} age: #{array_i.age}"}
    input = gets_user_input.to_i
    array[input-1]
  else
    array[0]
  end
end
end
