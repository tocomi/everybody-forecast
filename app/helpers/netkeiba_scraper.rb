require 'open-uri'
require 'nokogiri'
require 'kconv'

def get_race_header
  # スクレイピング先のURL
  url = 'http://race.netkeiba.com/?pid=race_list&'
  doc = doc_parser(url)
  
  @race_header = []
  index = 0
  doc.css("#race_list_header").css("dd").each do |node|
    header = {}
    header[:date] = node.css("a").attribute("title").value
    header[:url] = node.css("a").attribute("href").value
    @race_header[index] = header
    index = index + 1
  end
  return @race_header
end

def get_race_list(query)

  # スクレイピング先のURL
  url = "http://race.netkeiba.com#{query}"
  doc = doc_parser(url)
    
  @race_list = []
  index = 0
  doc.css("#race_list_body").css(".race_top_hold_list").css("li").each do |node|
    race = {}
    race[:title] = node.css(".racename").css("a").attribute("title").value
    race[:detail] = node.css(".racedata").inner_text
    @race_list[index] = race
    index = index + 1
  end
  return @race_list

end

def doc_parser(url)  
  html = open(url).read
  # htmlをパース(解析)してオブジェクトを作成
  return Nokogiri::HTML.parse(html.toutf8, nil, 'utf-8')
end