---
layout: post
title: "A bot for Cyx"
comments: true
published: true
categories:
  - CoffeeScript

---

As a tracer bullet for the game of Go I've been working on for the past ten
years (yes, it is a long time, and for my defense I re-wrote it from scratch a
bunch of times), I made [Cyx](http://antoine.goutenoir.com/games/cyx).

It's been highlighted [in the Chrome Webstore](https://chrome.google.com/webstore/detail/cyx/gppkphoaidmofdbcdnhlmanhgodbfmnj) lately,
and since then thousands of players try it every day.

You can only play it against a local friend or against the computer.

I had made a dumb computer player on purpose, with probabilities of skipping good decisions and limited board analysis.
Some players found it much too easy and asked for a smarter bot to play against.

It is actually much _easier_ to make a _smart_ computer player than it is to make a _fun_ computer player.

Below is the code of the bot of the _Expert_ solo mode.

``` coffeescript
###
If it is the opening move, play on a random empty tile.
Otherwise, For each tile that has been played on,
find all the potential shapes that the owner of the tile may make around it
and increment the will on each remaining tile of each of these shapes.
Then, pick a random tile amongst the ones with the highest incentive.

Options :
- game: required, an instance of Cyx.Game
###
class Cyx.Player.SimpleBot extends Cyx.Player.Bot

  constructor: (@game) ->

  ###
  Returns the tile on which the bot wants to play, or undefined if it does not
  want to play on anything, usually because there is no free tile left to play.
  ###
  play: (lattice) ->

    # The will of the bot, tying each tile to an incentive to play on it
    # There are no hashmaps in coffeescript, so we use two objects
    willK = {} # Tile coordinates as string => Tile object
    willV = {} # Tile coordinates as string => Incentive to play on it (int)

    for move in @game.moves
      potentialShapes = @game.findPotentialShapesAround move.tile
      for shape in potentialShapes
        for tile in shape.remain
          # If it's a finishing move, make sure the incentive is high
          will = if shape.remain.length == 1 then 42 else shape.played.length
          # But make sure we prioritize instant winning if it is available
          if shape.remain.length == 1 && move.player == this then will *= 2
          if not willK[tile] then willK[tile] = tile
          if not willV[tile] then willV[tile] = will else willV[tile] += will

    # Either it is the opening move or there is nowhere to play.
    # As the AI never opens the game and the game ends when there are no free
    # tiles left, this should never happen, unless we start AI competitions.
    if willV.length == 0 then return lattice.getRandomEmptyTile()

    # Figure out which tiles have the best incentive
    max = Object.keys(willV).reduce(
      ((m, k) -> if willV[k] > m then willV[k] else m),
      -Infinity
    )
    best = (tile for tile in Object.keys(willV) when willV[tile] == max)

    # And pick one at random amongst the best
    willK[GMF.Util.getRandomArrayValue(best)]
```

If you cannot beat it, ponder on the fact that the code is 50 lines long...

Like every game maker, I enjoy the bitter tears of my players ! ;)
