class Game
  constructor: ->
    @currentLevel = -1
    @levels = []
    @cost = 0

  addLevel: (level) ->
    level.addToGame(this, @levels.length)
    @levels.push(level)

  end: ->
    @cost += @levels[@currentLevel].cost
    @levels[@currentLevel].hide()
    @levels[@currentLevel].destroy()
    # show credits

  next: ->
    @currentLevel++
    @levels[@currentLevel].render()
    if @currentLevel > 0
      prevLevel = @levels[@currentLevel - 1]
      @cost += prevLevel.cost
      prevLevel.hide()
      prevLevel.destroy()
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
