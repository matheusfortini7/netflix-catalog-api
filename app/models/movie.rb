class Movie
  include Mongoid::Document

  field :show_id, type: String
  field :show_type, type: String
  field :title, type: String
  field :director, type: String
  field :cast, type: String
  field :country, type: String
  field :date_added, type: String
  field :release_year, type: Integer
  field :rating, type: String
  field :duration, type: String
  field :listed_in, type: String
  field :description, type: String
end
