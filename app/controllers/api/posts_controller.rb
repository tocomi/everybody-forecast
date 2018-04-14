class Api::PostsController < ApplicationController
  def show
    @posts = Post.where("race_id = ?", params[:id])
                 .joins("INNER JOIN users ON posts.user_id = users.id")
                 .select("users.id, users.display_name, posts.comment, posts.created_at")
                 .order("posts.created_at DESC")
    render 'show', formats: 'json', handlers: 'jbuilder'
  end
end
