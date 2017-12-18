class SongsController < ApplicationController
	def index
		@user = User.find(session[:user_id])
		@songs = Song.all
		@adds = Add.all
	end

	def create
		song = Song.create(song_params)
		if song.valid?
			return redirect_to song_index_path
		end
		flash[:errors] = song.errors.full_messages
		return redirect_to :back
	end

	def show
		@song = Song.find(params[:id])
		list = @song.adds
		count = @song.adds.count
	end

	private
		def song_params
			params.require(:song).permit(:title, :artist).merge(user_id: session[:user_id])
		end
end