class Horse

  attr_reader :gate_number, :horse_number, :name, :sex, :age, :handi, :jockey, :odds, :rank

  def initialize(gate_number, horse_number, name, age_handi_jockey, odds_and_rank)
    @gate_number = gate_number
    @horse_number = horse_number
    @name = name
    horse_sex_age = get_horse_sex_age(age_handi_jockey.split(" ")[0])
    @sex = convert_sex_mark(horse_sex_age.slice(0))
    @age = horse_sex_age.slice(1..-1)
    @handi = age_handi_jockey.split(" ")[1]
    @jockey = age_handi_jockey.split(" ")[2]
    odds_rank_map = get_odds_rank_map(odds_and_rank)
    @odds = odds_rank_map[:odds]
    @rank = odds_rank_map[:rank]
  end

  def get_gate_class
    base_class = 'horse-table gate-number'
    case @gate_number
    when '2' then
      base_class + ' ' + 'background-black'
    when '3' then
      base_class + ' ' + 'background-red'
    when '4' then
      base_class + ' ' + 'background-blue'
    when '5' then
      base_class + ' ' + 'background-yellow'
    when '6' then
      base_class + ' ' + 'background-green'
    when '7' then
      base_class + ' ' + 'background-orange'
    when '8' then
      base_class + ' ' + 'background-pink'
    else
      base_class
    end
  end

  def get_sex_class
    base_class = 'horse-table horse-sex'
    if @sex == '♂' then
      base_class + ' ' + 'background-blue'
    elsif @sex == '♀' then
      base_class + ' ' + 'background-red'
    else
      base_class
    end
  end

  private

    def get_horse_sex_age(age_and_color)
      return age_and_color.split("/")[0]
    end

    def get_odds_rank_map(odds_and_rank)
      odds_rank_map = {}
      /\(/ =~ odds_and_rank
    odds_rank_map[:odds] = $`
      rank_string = $'
      /[0-9]*/ =~ rank_string
      odds_rank_map[:rank] = $&
      return odds_rank_map
    end

    def convert_sex_mark(sex)
      if sex == '牡'
        return '♂'
      elsif sex == '牝'
        return '♀'
      end
      return sex
    end

end
