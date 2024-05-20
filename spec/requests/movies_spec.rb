require 'rails_helper'

describe 'Catálogo filmes API', type: :request do
  describe 'GET /movies' do
    before do
      FactoryBot.create(:movie, show_id: 's9000', type: 'Movie', title: 'Get out',
                        director: 'Jordan Peele', cast: 'Daniel Kaluuya, Allison Williams',
                        country: 'United States', date_added: 'December 1, 2018', release_year: 2018,
                        rating: 'TV-14', duration: '70 min', listed_in: 'Comedies, Dramas, International Movies',
                        description: "Test1.")

      FactoryBot.create(:movie, show_id: 's9001', type: 'Tv show', title: 'Breaking Bad',
                        director: 'vince gilligan', cast: 'bryan cranston, Aaron Paul', country: 'Argentina',
                        date_added: 'December 1, 2018', release_year: 2014, rating: 'TV-14', duration: '70 min',
                        listed_in: 'Comedies, Dramas, International Movies', description: "Test2.")
    end

    it 'Returns all movies/tv shows' do
      get "/movies"

      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq(2)
    end

    it 'Returns all movies/tv shows given a parameter' do
      get '/movies?country'

      expect(JSON.parse(response.body).first['country']).to eq('Argentina')
    end



  end

  describe 'POST /movies' do
    it 'Stores all movies/tv from CSV' do
      post '/movies'

      expect(response).to have_http_status(:success)
      expect(Movie.count).to eq(131)
    end
  end

end
