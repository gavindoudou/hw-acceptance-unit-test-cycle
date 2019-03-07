require 'rails_helper'
require 'movies_controller.rb'
require 'movie.rb'

RSpec.describe MoviesController, type: :controller do
    describe 'GET show' do
        it 'assigns @movie' do
            Movie.create!(:title => "Zootopia", :rating => "PG", :director => "Byron Howard", :release_date => "2016-02-13")
            mov = Movie.find_by_title("Zootopia")
            get :show, {:id => mov.id}
            expect(assigns(:movie)).to eq(mov)
        end
        it 'renders the show template' do
            Movie.create!(:title => "Zootopia", :rating => "PG", :director => "Byron Howard", :release_date => "2016-02-13")
            mov = Movie.find_by_title("Zootopia")
            get :show, {:id => mov.id}
            expect(response).to render_template("show")
            #assert_generates "/movies/#{mov.id}", { controller: 'movies', action: 'show', id: mov }
            #assert_routing({path: 'movies/1', method: :get}, { controller: 'movies', action: 'show', id: '1' })
        end
    end
        describe 'update' do
        it 'assigns @movie' do
            Movie.create!(:title => "Zootopia 2016", :rating => "PG-13", :director => "Rich Moore", :release_date => "2016-02-13")
            mov = Movie.find_by_title("Zootopia 2016")
            patch :update, {:id => mov, movie: {
                title: "Zootopia", 
                rating: "PG", 
                director: "Byron Howard", 
                release_date: "2016-02-13" }}
            mov = Movie.find_by_title("Zootopia")
            expect(assigns(:movie)).to eq(mov)
            expect(mov.title).to eq("Zootopia")
            expect(mov.director).to eq("Byron Howard")
        end
        it 'flashes an update notice' do
            Movie.create!(:title => "Zootopia 2016", :rating => "PG-13", :director => "Rich Moore", :release_date => "2016-02-13")
            mov = Movie.find_by_title("Zootopia 2016")
            patch :update, {:id => mov, movie: {
                title: "Zootopia", 
                rating: "PG", 
                director: "Byron Howard", 
                release_date: "2016-02-13" }}
            movTitle = Movie.find_by_title("Zootopia").title
            expect(flash[:notice]).to eq("#{movTitle} was successfully updated.")
        end
        it 'redirects to the details page' do
            Movie.create!(:title => "Zootopia 2016", :rating => "PG-13", :director => "Rich Moore", :release_date => "2016-02-13")
            mov = Movie.find_by_title("Zootopia 2016")
            patch :update, {:id => mov, movie: {
                title: "Zootopia", 
                rating: "PG", 
                director: "Byron Howard", 
                release_date: "2016-02-13" }}
            mov = Movie.find_by_title("Zootopia")
            expect(response).to redirect_to(movie_path(mov))
        end
end
end