class Api::UsersController < ApplicationController
  def show
    @current_user = current_user
    render 'current_user', formats: 'json', handlers: 'jbuilder'
  end
end
