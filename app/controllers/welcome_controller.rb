class WelcomeController < ApplicationController
  require_relative './../helpers/netkeiba_scraper'
  def index
    get_race_header()
    @race_list = []
  end
end
