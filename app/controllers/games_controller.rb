class GamesController < ApplicationController
	before_action :must_be_logged_in, except: [:index]
	before_action :current_user
	before_action :must_be_admin, except: [:index, :show]

	def index
		# current_user
		if params[:user_id].present?
			@games = current_user.games
		else
			@games = Game.all
		end
	end

	def show
		# current_user
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
