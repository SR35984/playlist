class AddsController < ApplicationController
	def create
		adds = Add.create(add_params)
		return redirect_to song_index_path
	end
	
	private
		def add_params
			params.require(:adds).permit(:song_id).merge(user_id: session[:user_id])
		end
end
