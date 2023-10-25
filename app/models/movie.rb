class Movie < ActiveRecord::Base
  def self.similar_movies(movie)
    where(director: movie.director)
  end
end