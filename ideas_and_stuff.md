* Movie, Actor, Movie Actors: A movie has many actors and an actor has many movies, movie_actors belongs to movie and actor
~_~_~_~_~_~_~_~_~_~_~_~_~_~_~_~_~_~_

Movie >-----< Actor
  |             |
  |             |
  ---< Works >---

Director?
  -----------------------------
  |                           |
 |||                          |
Movie >-----< Actor >----< Director
  |             |             
  |             |             
  ---< Works >---             

Director
  ~_~_~_~_~_~_~_~_~_~_~_~_~_~_~_~_~_~_

Movie Has many Actor through Works
Actor Has Many Movie though Works
Works Belong to Actor
Works Belong to Movie

Movie
-id
-title
-year
-director_id (needs migration)

Actor
-id
-name
-birthday
-hometown

Work
-id
-movie_id
-actor_id

Director (Optional)
-id
-name

######################
some possible queries and stretch queries
-list of actors and movies
-find actor or movie(downcase.strip to format and remove white space)
-lists by attributes
  -list of actors by birthday
  -list of movie by year
-lists by attribute and movie/actor
-trivia - if in api maybe a trivia attribute that is text that can be passed to the database, perhaps rewritten as a question. Wonder if there are any webapps that can jeopardy-ize a statement.
######################
OPTIONAL Director Model Below
######################
-open movie database has api. explore more to seed or to live lookup
-maybe add director model.
--director has many movies and Actors
--movie belongs to a director (in this model one director)

--what does this look like?
~_~_~_~_~_~_~_~_~_~_~_~_~_~_~_~_~_~_

Actor>----<Director----<Movie
 |                       |
 |                       |
 ---------<Works>---------

~_~_~_~_~_~_~_~_~_~_~_~_~_~_~_~_~_~_

#########################
some basic queries
-list of directors

-name search
-movie director
-lists of director per actor or list of actors worked with per director  - through through movie through works?

actor:
-year with most movies

Movie
-all the actors from single hometown on the movie instance
