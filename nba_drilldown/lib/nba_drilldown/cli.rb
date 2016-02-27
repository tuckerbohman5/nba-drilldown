class NbaDrilldown::CLI

def call
  NbaDrilldown::Team.create_teams
  
  #scrape_website
  puts "Welcome to NBA Drilldown!"
  
  puts "Please enter the number for a team to see its players or type 31 to exit"
  NbaDrilldown::Team.list_teams
  puts "31. Exit!!!"

  input = gets.chomp.to_i
   if input == 31
    puts "Goodbye!"
  elsif input == (1..30)
    team.NbaDrilldown::Team.find_team(input)
    team.create_players_from_team
     team.list_players
  else
      puts "I am sorry please enter a valid team number"
      
    end
  end
  

 
end



def conference_breakdown
  puts "Conference Breakdown"
end

def scrape_website
  #NbaDrilldown::Conference.create_by_scraping
  NbaDrilldown::Team.create_teams
  NbaDrilldown::Team.create_players_from_team_url
end


end