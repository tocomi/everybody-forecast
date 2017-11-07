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
    adjusted_target = adjust_target(params[:target])
    get_horse_list(adjusted_target)
    get_forecast(adjusted_target)
  end

  def adjust_target(target)
    target = target.gsub("race_old", "race")
    target = target << "&mode=shutuba"
    return target
  end

  def get_forecast(target)
    # race_id = target.split("&")[1][-12..-1].to_i
    # @forecasts = Forecast.where(race_id: race_id)
    @forecasts = {}
  end

  def save_forecast()

  end

end
