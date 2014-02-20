class Game
  constructor: ->
    @currentLevel = -1
    @levels = []

  addLevel: (level) ->
    level.addToGame(this, @levels.length)
    @levels.push(level)

  end: ->
    @levels[@currentLevel].hide()
    @levels[@currentLevel].destroy()
    # show credits

  next: ->
    @currentLevel++
    @levels[@currentLevel].render()
    if @currentLevel > 0
      @levels[@currentLevel - 1].hide()
      @levels[@currentLevel - 1].destroy()
    @levels[@currentLevel].show()

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

window.Level = Level

window.Game = new Game()
