class MoviesController < ApplicationController
  def create
    MovieImporterService.call
    render json: { status: :success }
  end

  def index
    if params[:search].present?
      render json: MoviesRepresenter.new(Movie.order(params[:search] => :asc)).as_json
    else
      render json: MoviesRepresenter.new(Movie.order(release_year: :asc)).as_json
    end
  end
end
