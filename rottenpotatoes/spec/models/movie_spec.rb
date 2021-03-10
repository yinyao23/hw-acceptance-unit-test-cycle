require 'rails_helper'

RSpec.describe Movie, type: :model do
    describe "search movies by director" do
        let(:movie_1) {Movie.create :id => 1, :title => 'fake_title_1', :director => 'yinyao'}
        let(:movie_2) {Movie.create :id => 2, :title => 'fake_title_2', :director => 'yinyao'}
        let(:movie_3) {Movie.create :id => 3, :title => 'fake_title_3', :director => 'qi'}
        it 'should return the correct matches for movies with the specified director' do
            expect(Movie.with_director(movie_1.director)).to include(movie_1, movie_2)
        end
        it 'should not return matches of movies with different directors' do
            expect(Movie.with_director(movie_1.director)).to_not include(movie_3)
        end
    end
end
