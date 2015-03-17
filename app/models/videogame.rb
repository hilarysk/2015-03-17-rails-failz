class Videogame < ActiveRecord::Base
  attr_accessible :title, :genre, :rating
end