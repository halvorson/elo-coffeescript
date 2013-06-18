Elo = require '../src/elo'

describe 'Elo', -> 
  it 'exists', ->
    Elo.should.be.ok
    elo = new Elo()
    elo.should.be.instanceOf Elo

    describe 'Elo defaults', ->
      it 'has default rating of 1500', ->
        elo = new Elo()
        default_rating = elo.newRating()
        default_rating.should.eql 1500

      it 'has default k_factor of 32', ->
        elo = new Elo()
        k_factor = elo.calculateK()
        elo.should.be.instanceOf Elo
        k_factor.should.eql 32

    describe 'Elo ratings, winning player', ->
      it 'winner should have new rating of 1516 when new players have default ratings', ->
        elo = new Elo()
        results = elo.calculateRatings(1500, 1500, 1, 0)
        results.player1.should.eql 1516

      it 'should have new rating of 1500 when new players have default ratings', ->
        elo = new Elo()
        results = elo.calculateRatings(1800, 1500, 1, 0)
        results.player1.should.eql 1827
        results.player2.should.eql 1472

      it 'expected loser wins', ->
        elo = new Elo()
        results = elo.calculateRatings(1800, 1500, 0, 1)
        results.player1.should.eql 1795
        results.player2.should.eql 1504