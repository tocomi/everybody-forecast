class Race

  attr_reader :title, :detail, :url

  def initialize(title, detail, url)
    @title = title
    @detail = detail
    @url = url
  end

  def get_race_id
    @url.split("&")[1][-12..-1].to_i
  end

  def get_race_number
    race_number = @url[-2..-1].to_i
    if race_number == 0 then
      race_number = @url.split("&")[1][-2..-1].to_i
    end
    race_number
  end

  def get_race_button_class
    base_class = 'btn race-detail'
    if forecast_registered? then
      base_class + ' ' + 'btn-success'
    else
      base_class + ' ' + 'btn-primary'
    end
  end

  def forecast_registered?
    Forecast.exists?(race_id: get_race_id)
  end

end
