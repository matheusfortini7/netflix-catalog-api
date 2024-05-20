class MoviesRepresenter
  def initialize(movies)
    @movies = movies
  end

  def as_json
    @movies.map do |movie|
      {
        "id":           movie.show_id,
        "title":        movie.title,
        "genre":        movie.show_type,
        "year":         movie.release_year,
        "country":      movie.country,
        "published_at": movie.date_added,
        "description":  movie.description
      }
    end
  end
end
