require 'open-uri'
require 'nokogiri'

def get_race_list

  # スクレイピング先のURL
  url = 'http://race.netkeiba.com/?acc_param=race'
    
  charset = nil
  html = open(url) do |f|
    charset = f.charset # 文字種別を取得
    f.read # htmlを読み込んで変数htmlに渡す
  end

  # htmlをパース(解析)してオブジェクトを作成
  doc = Nokogiri::HTML.parse(html, nil, charset)
    
  @race_list = []
  index = 0
  doc.css("#race_list_body").css(".race_top_hold_list").css("li").each do |node|
    race = {}
    race['title'] = node.css(".racename").css("a").attribute("title").value
    race['detail'] = node.css(".racedata").inner_text
    @race_list[index] = race
    index = index + 1
  end
  return @race_list

end