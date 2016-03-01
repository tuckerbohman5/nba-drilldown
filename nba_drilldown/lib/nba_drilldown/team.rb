class NbaDrilldown::Team
  attr_accessor :name, :conference, :players, :url, :record, :roster_url

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
      new_team.add_record_to_team
      @@all << new_team
    end

  end

  def add_record_to_team
    doc = Nokogiri::HTML(open(self.url))
    self.record = doc.search("li.record").first.text

  end

  def list_players
    puts "Name|Number|Position"
    self.players.each do |player|
      puts "#{player.name}|#{player.number}|#{player.position}"
    end
  end

  def self.find_team(input)
    team = @@all[input-1]
    team
  end

  def self.list_teams
      puts "Team Name --- Team Record"
    @@all.each_with_index do |team, index|
      puts "#{index + 1}. #{team.name} --- #{team.record}"
    end
  end

  def self.all
    @@all
  end


  def create_players_from_team
    self.roster_url = self.format_team_url
      
      doc = Nokogiri::HTML(open(self.roster_url))
      doc.search("td.sortcell a").each do |player|
      new_player = NbaDrilldown::Player.create_from_data(player)
      
      new_player.add_player_info
      new_player.team = self
      
      self.players << new_player
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