class Player
	attr_accessor :name, :blood, :mana
	def initialize name_input
		@name=name_input
		@blood=100
		@mana=40
	end
	def attack
		@mana-=10
	end
	def defend
		@blood-=25
	end
end
@players=Hash.new
def menu
	puts "=============================="
	puts "Welcome to the Battle Arena" 
	puts "----------------------------------------------------"
	puts "Description"
	puts "1 type 'new' to create a character"
	puts "2. type 'start' to begin the fight"
	puts "please select your players"
	puts "**********************************"
	@players.each do |key, player|
		puts "current player/s"	
		puts player.name
		puts "**********************************"
	end
	number_player
end
def create_player
	name_player = gets.chomp
	@players[name_player]=Player.new name_player
	menu
end
def number_player 
	input_user= gets.chomp
	if input_user.eql? "new"
		if @players.count < 3
			puts 'please enter name of Player:'
			create_player
		else
			puts 'sorry you can not playing, maximum of players is 3 players'
			menu
		end
	else
		if @players.count > 1
			start_game
		else
			puts 'you cannot playing now, please create more players'
			menu
		end
	end
end
def start_game
	puts 'who will attack?'
	player_attack=gets.chomp
	puts 'who will defend?'
	player_defend=gets.chomp
	@players[player_defend].attack
	@players[player_attack].defend
	puts "name  blood mana"
	puts "#{@players[player_defend].name} #{@players[player_defend].blood} #{@players[player_defend].mana}"
	puts "#{@players[player_attack].name} #{@players[player_attack].blood} #{@players[player_attack].mana}"
	durration_game(player_defend,player_attack)
end
def new_menu
		menu
end
def lanjut_game
	answer_input = gets.chomp
	if answer_input.eql? "yes"
		@players=Hash.new 
		new_menu
	else
		puts "thaks for playing"
	end
end
def durration_game(player_defen,player_attac)
	if @players[player_defen].blood == 0
		puts"game over"
		puts "continue the game?yes/no"
		lanjut_game
	elsif @players[player_attac].blood == 0
		puts"game over"
		puts "continue the game?yes/no"
		lanjut_game
	else
		start_game
	end
end
menu
