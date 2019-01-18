class UserGamesController < ApplicationController
  def create  	
  	game = Game.find(params[:game_id])  	
  	current_user.add_game(game)  	
  	redirect_to user_path(@current_user)
  end

  def update
  end

  def destroy
  end 

end
