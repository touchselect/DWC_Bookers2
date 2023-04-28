class RelationshipsController < ApplicationController
	def create
		user = User.find(params[:user_id])
		follow = Relationship.new
		follow.follower_id = current_user.id
		follow.followed_id = user.id
		follow.save
		redirect_to users_path
	end

	def destroy
		user = User.find(params[:user_id])
		unfollow = Relationship.find_by(follower_id: current_user.id, followed_id: user.id)
		unfollow.destroy
		redirect_to users_path
	end
end
