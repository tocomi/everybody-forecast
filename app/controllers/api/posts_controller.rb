class Api::PostsController < ApplicationController
  protect_from_forgery :except => [:create]

  def show
    @posts = Post.where("race_id = ?", params[:id])
                 .joins("INNER JOIN users ON posts.user_id = users.id")
                 .select("users.id, users.display_name, posts.comment, posts.created_at")
                 .order("posts.created_at DESC")
    render 'show', formats: 'json', handlers: 'jbuilder'
  end

  def create
    @post = Post.create(race_id: params[:race_id], user_id: params[:user_id], comment: params[:comment])
    head :no_content
  end
end
