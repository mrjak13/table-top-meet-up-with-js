class GamesController < ApplicationController
	before_action :must_be_logged_in, except: [:index]
	before_action :current_user
	before_action :must_be_admin, except: [:index, :show]
	before_action :assign_game, only: [:show, :edit, :update, :destroy]

	def index
		if params[:user_id].present?
			@games = current_user.games
		else
			@games = Game.all
		end
	end

	def show
		@game = Game.find(params[:id])
		@user_game = UserGame.find_by(user_id: @current_user.id, game_id: @game.id)
	end

	def new
		@game = Game.new
	end

	def create
		@game = Game.create(games_params)
		if @game.valid?
			redirect_to game_path(@game)
		else
			render new_game_path
		end
	end

	def edit
	end

	def update
		@game.update(games_params)

		if @game.valid?
			redirect_to game_path(@game)
		else
			redirect_to edit_game_path
		end
	end

	def destroy
		@game.destroy
		flash[:message] = "Game deleted"
		redirect_to games_path
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

	def assign_game
		@game = Game.find(params[:id])
	end
end
