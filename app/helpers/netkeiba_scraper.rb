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

  @race_per_place_list = []
  index_per_place = 0
  doc.css("#race_list_body").css(".race_top_hold_list").each do |day_node|
    index = 0
    race_list = []
    race_place_info = {}
    race_place_info[:date] = day_node.css(".race_top_hold_data").css(".kaisaidata").inner_text
    race_place_info[:condition] = day_node.css(".race_top_hold_data").css(".jyodata").inner_text
    day_node.css("li").each do |node|
      title = node.css(".racename").css("a").attribute("title").value
      detail = node.css(".racedata").inner_text
      url = node.css("dt").css("a").attribute("href").value
      race = Race.new(title, detail, url)

      race_list[index] = race
      index = index + 1
    end
    race_per_place = {}
    race_per_place[:race_place_info] = race_place_info
    race_per_place[:race_list] = race_list
    @race_per_place_list[index_per_place] = race_per_place
    index_per_place = index_per_place + 1
  end
  return @race_per_place_list
end

def get_race_number(url)
  race_number = url[-2..-1].to_i
  if race_number == 0 then
    race_number = url.split("&")[1][-2..-1].to_i
  end
  return race_number
end

def get_race_info(query)
  # スクレイピング先のURL
  url = "http://race.netkeiba.com#{query}"
  doc = doc_parser(url)

  # レース詳細の取得
  @race_detail = get_race_detail(doc)
  # 出走馬データの取得
  @horse_list = get_horse_detail(doc)
end

def get_race_detail(doc)
  race_detail = {}
  race_info = doc.css(".mainrace_data")
  race_detail[:number] = race_info.css(".racedata").css("dt").inner_text
  race_detail[:name] = race_info.css(".racedata").css("dd").css("h1").inner_text
  race_detail[:condition] = race_info.css(".racedata").css("dd").css("p").css("span").inner_text
  race_detail[:date_age] = race_info.css(".race_otherdata").css("p")[0].inner_text
  return race_detail
end

def get_horse_detail(doc)
  horse_list = []
  index = 0
  doc.css("#race_main").css(".shutuba_table").css("tr").each do |node|
    if index == 0 then # header
      header = {}
    else # content
      gate_number = node.css("td")[0].css("span").text
      horse_number = node.css(".umaban").text
      name = node.css(".h_name").css("a").inner_text
      age_handi_jockey = node.css(".txt_l")[1].inner_text
      odds_and_rank = node.css(".txt_c").inner_text
      horse = Horse.new(gate_number, horse_number, name, age_handi_jockey, odds_and_rank)

      # index:0 はヘッダーが入ってひとつずれるので-1している
      horse_list[index - 1] = horse
    end
    index = index + 1
  end
  return horse_list
end

def doc_parser(url)
  html = open(url).read
  # htmlをパース(解析)してオブジェクトを作成
  return Nokogiri::HTML.parse(html.toutf8, nil, 'utf-8')
end
