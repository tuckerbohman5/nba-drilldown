class NbaDrilldown::Player
  attr_accessor :name, :team, :conference, :position, :number, :url

  @@all = []

  def initialize

  end


  def self.create_from_data(player)
    
    
    #doc.search("td.sortcell a").each do |player|
      new_player = NbaDrilldown::Player.new
      new_player.name = player.text
      
      new_player.url = player['href']
      @@all << new_player
      new_player
     
      
    
  end 

  def add_player_info
    doc = Nokogiri::HTML(open(self.url))
    binding.pry
    #add number,position,experience, height

  end

  def self.list_players
    @@all.each do |player|
      puts player.name
    end
  end



end