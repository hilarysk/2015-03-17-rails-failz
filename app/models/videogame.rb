class Videogame < ActiveRecord::Base
  attr_accessible :title, :genre, :rating
  
  validates :title, uniqueness: { case_sensitive: false }
  validates :title, :rating, :genre, presence: true 
end