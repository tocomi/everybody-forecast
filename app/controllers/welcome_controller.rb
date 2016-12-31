class WelcomeController < ApplicationController
  require_relative './../helpers/netkeiba_scraper.rb'
  def index
    get_race_list
  end
end
