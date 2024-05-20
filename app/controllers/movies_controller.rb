class MoviesController < ApplicationController
  FILE_PATH = "./lib/csv/netflix_titles.csv"

  def create
    CSV.foreach(FILE_PATH, headers: :first_row, header_converters: :symbol) do |row|
      Movie.create(
        show_id:      row[:show_id],
        show_type:    row[:type],
        title:        row[:title].strip,
        director:     row[:director],
        cast:         row[:cast],
        country:      row[:country],
        date_added:   row[:date_added],
        release_year: row[:release_year],
        rating:       row[:rating],
        duration:     row[:duration],
        listed_in:    row[:listed_in],
        description:  row[:description],
      )
    end
    render json: { status: :success, message: "Registros concluídos com sucesso!" }
  end

  def index
    if params[:search].present?
      render json: MoviesRepresenter.new(Movie.order(params[:search] => :asc)).as_json
    else
      render json: MoviesRepresenter.new(Movie.order(release_year: :asc)).as_json
    end
  end
end
