class HorseRaceController < ApplicationController
  require 'uri'
  require_relative './../helpers/netkeiba_scraper'

  # forecast data
  @forecasts
  # flag for display combobox
  @exists_forecast
  @forecast_select

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
    get_race_info(adjust_target(params[:target]))
    get_forecast
  end

  def adjust_target(target)
    target = target.gsub("race_old", "race")
    target = target << "&mode=shutuba"
    return target
  end

  def get_forecast()
    @forecasts = Forecast.where(race_id: get_race_id)
  end

  def save_forecast()
    forecast = Forecast.new(user_id: 1, race_id: params[:race_id], horse_number: params[:horse_number], forecast: params[:forecast])
    forecast.save 
  end

  def get_race_id
    adjust_target(params[:target]).split("&")[1][-12..-1].to_i
  end

end
