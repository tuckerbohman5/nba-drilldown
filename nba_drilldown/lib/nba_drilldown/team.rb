class NbaDrilldown::Team
  attr_accessor :name, :conference, :players, :url

  @@all = []

  def initialize
    @players = []


  end


  def self.create_teams
    doc = Nokogiri::HTML(open("http://espn.go.com/nba/teams"))
    doc.search("a.bi").each do |team| 
      new_team = NbaDrilldown::Team.new
      new_team.name = team.text
      new_team.url = team["href"]
      @@all << new_team
    end

  end



  def self.all
    @@all
  end

  def self.create_players_from_team_url
    self.all.each do |team|
      
      team.url = team.format_team_url
      
      doc = Nokogiri::HTML(open(team.url))
      doc.search("td.sortcell a").each do |player|
      new_player = NbaDrilldown::Player.create_from_data(player)
      
      new_player.add_player_info
      new_player.team = self
      
      self.players << new_player
      end
    end
      
  end



  def format_team_url
    split_array = self.url.split("/")
    new_array = []
    split_array.each do |text|
      if text == "_"
        text = "roster"
        new_array << text
      else 
        new_array << text
      end
    end
    new_array.pop
    new_array.insert(6,"_")
    new_array.join("/")
  end


end