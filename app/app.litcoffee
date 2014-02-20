300.01
======

An experiential game about anxiety and mental health.

## Our game

    class Game
      constructor: ->
        @currentLevel = -1
        @levels = []
        @cost = 0

      addLevel: (level) ->
        level.addToGame(this, @levels.length)
        @levels.push(level)

      next: ->
        @currentLevel++
        @levels[@currentLevel].render()
        if @currentLevel > 0
          @finishLevel(@levels[@currentLevel - 1])
        @levels[@currentLevel].show()

      end: ->
        @finishLevel(@levels[@currentLevel])
        # show credits

      finishLevel: (level) ->
        @cost += level.cost
        level.hide()
        level.destroy()

## A level within the game

    class Level
      constructor: (@name, @cost) ->
        @View = Backbone.View.extend(
          tagname: 'div'
          className: 'level'
          render: ->
        )

      addToGame: (@game, @levelNumber) ->

      complete: ->
        if @levelNumber == @game.levels.length - 1
          @game.end()
        else
          @game.next()

Make the Level class available outside this file for subclassing

    window.Level = Level

Create a new game and make it available to the browser - we can start it there.

    window.Game = new Game()
