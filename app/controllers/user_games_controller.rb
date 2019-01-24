class UserGamesController < ApplicationController
  before_action :must_be_logged_in
  
  	def create  	
      game = Game.find(params[:game_id])    
  		current_user.add_game(game)

  		redirect_to game_path(game)
  	end

  	def update
  		@user_game = UserGame.find(params[:id])
  		@user_game.favorite == false ? @user_game.favorite = true : @user_game.favorite = false
  		@user_game.save 

  		redirect_to game_path(@user_game.game)
  	end

  	def destroy
  		@user_game = UserGame.find(params[:id])
  		@user_game.destroy
  		
  		redirect_to game_path(@user_game.game)
  	end 

end
