def testing_name
  # testing = CSV.read('../testdata.csv')
  names = CSV.read('../movieData.csv').map{|row|row[0]}
  names.pop
  names.shift
  names
end


def partial_actor_search(actor)

end
#
# def testing_year
#   years = CSV.read('../testdata.csv').map{|row| row[1]}
#   years.pop
#   years.shift
#   years
# end
#
# def testing_genre
#   genres = CSV.read('../testdata.csv').map{|row| row[2]}
#   genres.pop
#   genres.shift
#   genres
# end
