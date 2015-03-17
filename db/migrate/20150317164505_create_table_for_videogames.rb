class CreateTableForVideogames < ActiveRecord::Migration
  def change
    create_table :videogames do |t|
     t.text :title
     t.text :genre
     t.text :rating
     t.timestamps
    end  
  end
end
