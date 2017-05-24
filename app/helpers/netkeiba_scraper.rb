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
    race[:url] = node.css("dt").css("a").attribute("href").value
    @race_list[index] = race
    index = index + 1
  end
  return @race_list

end

def get_horse_list(query)

  # スクレイピング先のURL
  url = "http://race.netkeiba.com#{query}"
  doc = doc_parser(url)

  @horse_list = []
  index = 0
  doc.css("#race_main").css(".shutuba_table").css("tr").each do |node|
    if index == 0 then # header
      header = {}
      logger.debug 'header'
    else # content
      horse = {}
      horse[:gate_number] = node.css("td")[0].css("span").text
      horse[:horse_number] = node.css(".umaban").text
      horse[:horse_name] = node.css(".h_name").css("a").inner_text
      age_handi_jockey = node.css(".txt_l")[1].inner_text
      age_handi_jockey_array = age_handi_jockey.split(" ")
      horse[:horse_age] = age_handi_jockey_array[0]
      horse[:horse_handi] = age_handi_jockey_array[1]
      horse[:horse_jockey] = age_handi_jockey_array[2]
      # index:0 はヘッダーが入ってひとつずれるので-1している
      @horse_list[index - 1] = horse
      logger.debug "horse: #{horse}"
    end
    index = index + 1
  end
  return @horse_list

end

def doc_parser(url)
  html = open(url).read
  # htmlをパース(解析)してオブジェクトを作成
  return Nokogiri::HTML.parse(html.toutf8, nil, 'utf-8')
end
