### 
Elo.coffee

Elo ratings system in coffeescript
###
class Elo

	constructor: (options = {}) ->
		@default_rating = if options.default_rating then options.default_rating else 1500
		@k_factor = if options.k_factor then options.k_factor else 32

	expectedScores: (rating1, rating2) ->
		scores = {
			'player1': 1 / (1 + Math.pow 10, (rating1 - rating2) / 400),
			'player2': 1 / (1 + Math.pow 10, (rating2 - rating1) / 400)
		}

	updateRating: (rating, score, expectedScore) ->
		Math.floor(rating + @k_factor * (score - expectedScore))

	newRating: () ->
		@default_rating

	# TODO: Change K based on ratings
	# TODO: Take into account number of matches played
	calculateK: (rating1, rating2) ->
		@k_factor

	calculateRatings: (rating1, rating2, score1, score2) ->
		scores = @expectedScores(rating1, rating2)
		results = {
			'player1': @updateRating(rating1, score1, scores['player1'])
			'player2': @updateRating(rating2, score2, scores['player2'])
		}


module.exports = Elo