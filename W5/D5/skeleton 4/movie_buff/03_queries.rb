def what_was_that_one_with(those_actors)
  # Find the movies starring all `those_actors` (an array of actor names).
  # Show each movie's title and id.
  
  Movie
    .joins(:actors)
    .where('actors.name IN (?)', those_actors)
    .group(:id)
    .having('COUNT(*) >= (?)', those_actors.length)  
    .select(:title, :id) 

end

def golden_age
  # Find the decade with the highest average movie score.
  Movie
    .group('decade') 
    .order('AVG(score) DESC')
    .select('(yr - yr%10) AS decade')
    .first
    .decade
end

def costars(name)
  # List the names of the actors that the named actor has ever
  # appeared with.
  # Hint: use a subquery
  movie_ids = Movie.joins(:actors).where('actors.name = ?', name).pluck(:id)

  Actor
    .joins(:movies)
    .where('movies.id IN (?) AND actors.name != ?', movie_ids, name)
    .distinct
    .pluck('actors.name')
end

def actor_out_of_work
  # Find the number of actors in the database who have not appeared in a movie
  Actor
    .left_joins(:movies)
    .where('movies.id IS NULL')
    .group(:name)
    .pluck('COUNT(actors.name)').sum
end

def starring(whazzername)
  # Find the movies with an actor who had a name like `whazzername`.
  # A name is like whazzername if the actor's name contains all of the
  # letters in whazzername, ignoring case, in order.

  # ex. "Sylvester Stallone" is like "sylvester" and "lester stone" but
  # not like "stallone sylvester" or "zylvester ztallone"
  whazzer_name = '%' + whazzername.upcase.split('').join('%') + '%'
  Movie
    .joins(:actors)
    .where('UPPER(actors.name) LIKE ?', whazzer_name)
end

def longest_career
  # Find the 3 actors who had the longest careers
  # (the greatest time between first and last movie).
  # Order by actor names. Show each actor's id, name, and the length of
  # their career.
  Actor
    .select('actors.id, actors.name, MAX(yr)-MIN(yr) AS career')
    .joins(:movies)
    .group('actors.id')
    .order('career DESC')
    .limit(3)
end
