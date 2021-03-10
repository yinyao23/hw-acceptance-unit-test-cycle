require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
	describe 'searching similar movies' do
			context 'with valid director' do
				let(:movie) {Movie.create :id => 1, :title => 'fake_title', :director => 'somebody'}
				it 'should call the model method that searches similar movies' do	
				  expect(Movie).to receive(:with_director).with(movie.director)
				  get :search, {:id => movie.id}
				end
				it 'should select the Search Results template for rendering' do
					get :search, {:id => movie.id}
					expect(response).to render_template('search')
				end
				it 'should make list of matches available to the Search Results Template' do
					fake_results = [double(Movie), double(Movie)]
					Movie.stub(:with_director).with(movie.director).and_return(fake_results)
					get :search, {:id => movie.id}
					expect(assigns(:movies)).to eq fake_results
				end
			end
			
			context 'with invalid director' do
				let(:movie) {Movie.create :id => 1, :title => 'fake_title', :director => ''}
				it 'should select the homapage template for rendering' do
					get :search, {:id => movie.id}
					expect(response).to redirect_to('/movies')
				end
			end
	end
end


