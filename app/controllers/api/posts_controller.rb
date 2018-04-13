class Api::PostsController < ApplicationController
  def show
    @posts = Post.where(race_id: params[:id])
    render 'show', formats: 'json', handlers: 'jbuilder'
  end
end
