class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

def rps_game_winner(game)
	raise WrongNumberOfPlayersError unless 
		game.length == 2
	raise NoSuchStrategyError unless
		game.all? {|p| p[1] =~ /[rps]/i}
	game[game_winner(game)]
end

def rps_tournament_winner(tournament)
	if game?(tournament)
		rps_game_winner(tournament)
	else
		rps_tournament_winner(
			[rps_tournament_winner(tournament[0])] + 
			[rps_tournament_winner(tournament[1])])
	end
end

def game?(game)
	game.length == 2 and 
	game.all? {|p| p[1] =~ /[rps]/i} and 
	game[0][0].is_a?(String)
end

def game_winner(game)
	winning_strategy(
		game[0][1].downcase,
		game[1][1].downcase)
end

def winning_strategy(fst, snd)
	if fst == "r"
		if snd == "p"; return 1; end
		if snd == "s"; return 0; end
		if snd == "r"; return 0; end
	end
	if fst == "s"
		if snd == "p"; return 0; end
		if snd == "r"; return 1; end
		if snd == "s"; return 0; end
	end
	if fst == "p"
		if snd == "r"; return 0; end
		if snd == "s"; return 1; end
		if snd == "p"; return 0; end
	end
end
 
#tournament = [[ [["Armando", "p"], ["Dave", "s"]], [["Richard", "r"], ["Michael", "S"]]],
#	[[["Allen", "S"], 	["Omer",  "P"]], [["David E.", "R"], ["Richard X.", "P"]] ]]
#game = tournament[0][0]
