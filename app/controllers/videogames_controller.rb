class VideogamesController < ApplicationController
  def view_all
   @videogames = Videogame.all
  end
  
  def update
    @videogames = Videogame.all
    @path = request.path_info
  
    if params["id"].nil? == false
      @update_partial = "/videogame/update_partial"
      @game = Videogame.where(id: params[:id])[0]
    end
  end
  
  def update_success #post
  params["rating"].strip!
  params["title"].strip!
  params["genre"].strip!
  params["id"].to_i
  existing_game = Videogame.find(params["id"]) #object of existing excerpt
  params.delete("id")

    if existing_game.update_attributes("rating" => "#{params["rating"]}", "title"=>"#{params["title"]}", "genre"=>"#{params["genre"]}")
      @message = "The videogame entry was successfully updated:"
      @updated_game = existing_game
    else
      @message = existing_game.errors.to_a
    end
  end

  def create_success #post
  params["rating"].strip!
  params["title"].strip!
  params["genre"].strip!
  
  a = Videogame.new("rating" => "#{params["rating"]}", "title"=>"#{params["title"]}", "genre"=>"#{params["genre"]}")

    if a.save
      @message = "Your new videogame was successfully added:"
      @new_game = a
    else
      @message = a.errors.to_a
    end
  end
  
  def delete
    @videogames = Videogame.all
  end
  
  def delete_success
    a = Videogame.find(params[:id])
    
    a.delete
    @message = "Your new videogame was successfully deleted:"
    @deleted_game = a
    
  end


end
