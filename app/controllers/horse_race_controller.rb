class HorseRaceController < ApplicationController
  require 'uri'
  require 'date'
  require_relative './../helpers/netkeiba_scraper'

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
    @forecasts = Forecast.where("race_id = ?", get_race_id)
  end

  def save_forecast()
    race_id = params[:race_id].to_i
    horse_number = params[:horse_number].to_i
    forecast = params[:forecast].to_i

    current_forecast = find_forecast(race_id, get_user_id, horse_number)
    # logger.debug("[%s] current_forecast: %s" % [DateTime.now.strftime("%Y/%m/%d %H:%M:%S"), current_forecast.to_s])

    if current_forecast then
      if delete?(forecast) then
        return delete_forecast(current_forecast)
      end
      return update_forecast(current_forecast, forecast)
    end
    return create_forecast(race_id, get_user_id, horse_number, forecast)
  end

  def get_race_id
    adjust_target(params[:target]).split("&")[1][-12..-1].to_i
  end

  def get_user_id
    1
  end

  def find_forecast(race_id, user_id, horse_number)
    Forecast.find_by(race_id: race_id, user_id: user_id, horse_number: horse_number)
  end

  def create_forecast(race_id, user_id, horse_number, forecast)
    Forecast.create(user_id: user_id, race_id: race_id, horse_number: horse_number, forecast: forecast)
  end

  def update_forecast(current_forecast, forecast)
    current_forecast.update_attributes(forecast: forecast)
  end

  def delete_forecast(forecast)
    forecast.destroy
  end

  def delete?(forecast)
    forecast == 0
  end

end
