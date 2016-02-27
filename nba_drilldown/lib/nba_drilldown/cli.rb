class NbaDrilldown::CLI

def call
  scrape_website
  puts "Welcome to NBA Drilldown!"
  puts "Please enter a number for your desired option:"
  puts "1. List standings"
  puts "2. List teams by conference"
  puts "3. List players"
  puts "4. Exit"
  input = nil
 
  while input != 4
    input = gets.to_i
    case input 
    when 1
      
      #NbaDrilldown::Team.list_standings
    when 2
      puts "Select a conference to list teams:"
      #NbaDrilldown::Conference.list_standings
      NbaDrilldown::Team.all.each do |team|
        puts "#{team.name}"
      end
    when 3
      puts "Toronto Raptors"

      #NbaDrilldown::Player.list_players

      
    when 4 
      puts "Have a great day! Goodbye!"
      break 
    else
      puts "Invalid input! Please choose one of these options:"
      puts "1. List standings"
      puts "2. List teams by conference"
      puts "3. Exit"
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