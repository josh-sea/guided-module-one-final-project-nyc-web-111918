t=0
50.times do
  t+=1
  Movie.create(title: Faker::Book.title, year: rand(1977..2018), director_id: rand(1..30))
end

def hometown_maker
  hometown_array = []
  5.times do
      city = Faker::Address.city
    if city == nil
      hometown_array << Faker::Address.city
    else
      hometown_array << city
    end
  end
  hometown_array
end
hometown_array = hometown_maker

def uniq_names
  array =[]
  while array.length != 100
    array << Faker::FunnyName.two_word_name
    array.uniq!
  end
  array
end
actor_names = uniq_names

i=0
100.times do
  hometown_calc = hometown_array[rand(0..hometown_array.length)]
  if hometown_calc
    Actor.create(name: actor_names[i], birthday: Faker::Date.birthday(15, 89), hometown: hometown_array.sample)
    i+=1
  end
end

i=0
100.times do
  i+=1
  Work.create(movie_id: rand(1..30),actor_id: i)
end

def uniq_names_director
  array2 =[]
  while array2.length != 100
    array2 << Faker::FunnyName.two_word_name
    array2.uniq!
  end
  array2
end
director_names = uniq_names_director

m = 0
50.times do
  Director.create(name: actor_names[m], age: rand(37..81))
  m+=1
end
