class NbaDrilldown::CLI

def call
  NbaDrilldown::Team.create_teams if NbaDrilldown::Team.all.empty?
  
  #scrape_website
  puts "Welcome to NBA Drilldown!"
  
  puts "Please enter the number for a team to see its players or type 31 to exit"
  NbaDrilldown::Team.list_teams
  puts "31. Exit!!!"

  input = gets.chomp.to_i
   if input == 31
    puts "Goodbye!"
  elsif (1..30).include?(input)
    team = NbaDrilldown::Team.find_team(input)
    team.create_players_from_team
    puts "The players of the #{team.name}"
     team.list_players
     continue?
  else
      puts "I am sorry please enter a valid team number"

    
  end
  

 
end



def continue?
  puts "Would you like to look at another team? Yes to return or No to exit."
    input = gets.chomp
    if input.downcase.capitalize == "Yes"
      call
    else
      puts "Goodbye!"
    end
  end

def scrape_website
  #NbaDrilldown::Conference.create_by_scraping
  NbaDrilldown::Team.create_teams
  NbaDrilldown::Team.create_players_from_team_url
end


end