class MovieImporterService
  require "csv"
  FILE_PATH = "./lib/csv/netflix_titles.csv"

  def self.call
    CSV.foreach(FILE_PATH, headers: true) do |row|
      movie_attributes = row.to_hash
      Movie.create!(movie_attributes)
    end
  end
end
