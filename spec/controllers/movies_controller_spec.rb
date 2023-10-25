require 'rails_helper'
require 'spec_helper'

RSpec.describe MoviesController, type: :controller do
  describe "get #movies" do

    context "when the specified movie has a director" do
      it "assigns all movies with the same director to @similar_movies" do
        movie_1 = Movie.create(title: "Movie1", director: "Sam Li")
        movie_2 = Movie.create(title: "Movie2", director: "Sam Li")
        get :similar, params: { id: movie_1.id }
        expect(response.body).to include(movie_2.title)
      end
    end

    context "when the specified movie has no director" do
      it "redirects to the home page with a notice" do
        movie_1 = Movie.create(title: "Movie1", director: nil)
        get :similar, params: { id: movie_1.id }
        expect(response).to redirect_to(movies_path)
        expect(flash[:alert]).to eq("'Movie1' has no director info")
      end
    end
  end
end
