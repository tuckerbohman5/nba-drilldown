  require "pry"
  require "nokogiri"
  require "open-uri"
class Team
    attr_accessor :name, :url

  @@all = []

  def self.create_teams
    doc = Nokogiri::HTML(open("http://espn.go.com/nba/teams"))
    doc.search("a.bi").each do |team| 
      new_team = Team.new
      new_team.name = team.text
      new_team.url = team["href"]
      @@all << new_team
    end

  end

  def self.all 
    @@all
  end

  def create_players_from_team
    doc = Nokogiri::HTML(open("#{self.url}"))
    binding.pry
      doc.search("a.text='Roster'")
  end

end


#Alright so this creating teams works. Teams now have a "name" and "url"
#Teams will have many players and also belong to a conference. How can we assign the teams to a conference?

#doc.search("a.bi").first["href"] #Get first team url
  
  #doc.search("a.bi") #returns all teams

  http://espn.go.com/nba/team/roster/_/name/bos = Roster URL 
  a = "http://espn.go.com/nba/team/_/name/bos/boston-celtics" = Team.url 

    
    a array_words = ["http:", "", "espn.go.com", "nba", "team", "_", "name", "bos",]


    a.split("/")
    new_array = []
    a.each do |text|
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
      
    #Array.insert()



  How can we automatically create this???
