class GamesController < ApplicationController
	def index
		@games = Game.all
	end

	def show
		current_user
		@game = Game.find(params[:id])
		@user_game = UserGame.find_by(user_id: @current_user.id, game_id: @game.id)
	end

	def new
	end

	def create
		@game = Game.create(games_params)
		if @game.valid?
			redirect_to game_path(@game)
		else
			redirect_to new_game_path
		end
	end

	def edit
		@game = Game.find(params[:id])
	end

	def update
	end

	def destroy
	end

	private

	def games_params
		params.require(:game).permit(
			:name,
			:description,
			:min_players,
			:max_players,
			:play_time,
			:mature_content
			)
	end
end
