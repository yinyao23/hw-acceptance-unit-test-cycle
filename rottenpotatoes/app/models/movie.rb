class Movie < ActiveRecord::Base
    def self.with_director(director)
        return Movie.where(director: director)
    end
end
