class NbaDrilldown::Conference
  attr_accessor :name

@@all = []

def initialize
  @teams = []

end


def self.create_by_scraping
  doc = Nokogiri::HTML(open("http://www.nba.com/standings/team_record_comparison/conferenceNew_Std_Cnf.html?ls=iref:nba:gnav"))
  
  doc.search("td.confTitle").each do |conf|

    c = NbaDrilldown::Conference.new
    c.name = conf.text
    @@all << c
end


end

def 

def self.all
  puts @@all
end

def self.list_standings
  @@all.each {|conference| puts conference.name}
end

end