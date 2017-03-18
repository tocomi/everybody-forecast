class WelcomeController < ApplicationController
  require 'uri'
  require_relative './../helpers/netkeiba_scraper'
  def index
    get_race_header()
    @race_list = []
  end
  
  def race_list()
    query = get_query_of_current_url()
    target = query['target']
    get_race_list(target)
  end
  
  def get_query_of_current_url()
    current_url = request.url
    uri = URI::parse(current_url)
    query_array = URI::decode_www_form(uri.query)
    query_hash = Hash[query_array]
  end
  
end
