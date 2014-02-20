300.01
======

## 2013 ICD-9-CM Diagnosis Code 300.01

### Panic disorder without agoraphopbia

* Short description: panic dis w/o agoraphobia
* ICD-9-CM 300.01 is a billable medical code that can be used to specify a diagnosis on a reimbursement claim.
* You are viewing the 2013 version of ICD-9-CM 300.01.
* More recent version(s) of ICD-9-CM 300.01: [2014](http://www.icd9data.com/2014/Volume1/290-319/300-316/300/300.01.htm).

### Description symptoms

* Panic attack
* Panic disorder
* Panic disorder WO agoraphobia

### 300.01 excludes

* panic disorder with agoraphobia ([300.21](http://www.icd9data.com/2013/Volume1/290-319/300-316/300/300.21.htm))

### Applies to

* Panic
  * attack
  * state

### Converted to ICD-10-CM

Convert to ICD-10-CM: 300.01 converts directly to:
* 2014 ICD-10-CM [F41.0](http://www.icd10data.com/ICD10CM/Codes/F01-F99/F40-F48/F41-/F41.0) Panic disorder \[episodic paroxysmal anxiety\] without agoraphobia

### ICD-9-CM Volume 2 Index entries containing back-references to 300.01:

* Anxiety (neurosis) (reaction) (state) [300.00](http://www.icd9data.com/2013/Volume1/290-319/300-316/300/300.00.htm)
  * panic type *300.01*
* Attack
  * panic *300.01*
* Disorder - see also Disease
  * panic *300.01*
    * with agoraphobia [300.21](http://www.icd9data.com/2013/Volume1/290-319/300-316/300/300.21.htm)
* Neurosis, neurotic [300.9](http://www.icd9data.com/2013/Volume1/290-319/300-316/300/300.9.htm)
  * panic type *300.01*
* Panic (attack) (state) *300.01*
  * reaction to exceptional stress (transient) [308.0](http://www.icd9data.com/2013/Volume1/290-319/300-316/308/308.0.htm)
* State
  * panic *300.01*

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
