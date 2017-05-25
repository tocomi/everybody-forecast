class HorseRaceController < ApplicationController
  require 'uri'
  require_relative './../helpers/netkeiba_scraper'

  def index
    get_race_header()
  end

  def race_list()
    target = params[:target]
    @date = params[:date]
    get_race_header()
    get_race_list(target)
  end

  def horse_list()
    adjusted_target = adjust_target(params[:target])
    get_horse_list(adjusted_target)
  end

  def adjust_target(target)
    target = target.gsub("race_old", "race")
    target = target << "&mode=shutuba"
    return target
  end

end
