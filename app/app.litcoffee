300.01
======

Generalized anxiety disorder and bipolar I disorder.

    diagnosis = [ 300.01, 296.63 ]

## 2013 ICD-9-CM Diagnosis Code 300.01

### Panic disorder without agoraphobia

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

300.01 converts directly to:
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

    prescriptions =
      fluoxetine: ['20mg', 'twice daily']
      lorazepam: ['125mcg', 'four times daily']
      alprazolam: ['0.5mg', 'as needed']
      propanolol: ['20mg', 'as needed']

## Our game

This is a game, but also a little bit more.

This is a game about the experience of dealing with mental illness,
specifically generalized anxiety disorder and bipolar I disorder.

This is not a game, it's a description of an experience.  One that I've gone
through, sure, but also one that's hopefully loose-woven enough to fit the
experiences of many.

This is not a game, it's a therapeutic tool to help me figure out and describe
the ways in which my anxiety, panic, and depression affect my life, as well as
a teaching-aid for others to learn about the same.

This is a game, and also not a game; it's a mixed-media art-form consisting of
written works and simple user interactions styled along the lines of a game.

    class Game
      constructor: (@hashEnabled) ->
        @currentLevel = if @hashEnabled and window.location.hash then parseInt(window.location.hash.split('#')[1], 10) else -1
        @levels = []
        @cost = new window.Cost
          amount: 0
          explanation: "None of this is free, you understand..."
        @costView = new window.CostView
          el: '#cost'
          model: @cost

      addLevel: (level) ->
        level.addToGame this, @levels.length
        @levels.push level

      next: ->
        @currentLevel++
        if @hashEnabled
          window.location.hash = @currentLevel
        if @currentLevel > 0
          @finishLevel @levels[@currentLevel - 1]
        curr = @levels[@currentLevel]
        curr.render()
        $('#title').text curr.name
        window.overlay.setUrl "/docs/level#{ @currentLevel + 1 }.html"
        window.overlay.activate()
        window.dispatcher.once('overlayClosed', () ->
          curr.show()
          if curr.chardinOverlay
            window.dispatcher.trigger 'chardinStart'
        )

      end: ->
        @finishLevel @levels[@currentLevel]
        window.overlay.setUrl '/docs/overlay.html'
        window.overlay.activate()

      finishLevel: (level) ->
        @cost.set
          amount: @cost.get('amount') + level.cost.get('amount')
          explanation: level.cost.get 'explanation'
        level.hide()
        level.destroy()

## A level within the game

There's little room for the concept of levels in a game that's not a game but
also maybe a game of some sort.  Even so, in order to make this a more
manageable task for me to work on - both in the sense of completing specific
portions of it, as well as giving myself the mental space to deal with
difficult topics - 300.01 is divided up into discrete levels, each of which
embodies a different task, a different facet of anxiety, or a different feature
of depression in the hope that, taken together, they might describe a more
complete and entire picture.

    class window.Level
      constructor: (@name, @chardinOverlay, costAmount, costExplanation) ->
        $('.level').html ''
        @cost = new window.Cost
          amount: costAmount
          explanation: costExplanation
        @levelComplete = false

      addToGame: (@game, @levelNumber) ->

      complete: ->
        if @levelNumber == @game.levels.length - 1
          @game.end()
        else
          @game.next()

      render: ->

      show: ->
        $('#title').text @name
        $('.level').show()

      hide: ->
        $('.level').hide()

      destroy: ->
        $('.level').removeClass().addClass('pure-u-1 level').html('')

Make the Level class available outside this file for subclassing.  I know
little about how much all of this will mean to you, the one who is looking at
it.  However, documentation is important.  It helps the author and those who
come after to more clearly understand intention.  That's at least one third of
programming, right there.  Comprehension, intention, implementation.

Create a new game and make it available to the browser - we can start it there.

    window.game = new Game(window.useHash)

    window.overlay.setUrl '/docs/app.html'

    window.overlay.el.height $(document).height() * 0.8
    $('.level').height $(document).height() * 0.75

## Okay.  Deep breath.

This overlay will show the written portion of the experience.  This comes
interwoven with the code - literally, the story and the code share the same
file.  This helps me pull together a more cohesive experience, or at least lets
me put this down in more than just words.  Once you've read (or not) the
written portion of each level, close the overlay by clicking the 'X' in the
upper right corner.  After that, the level itself will be exposed, and you will
be given a task.  Each level comes at a cost, and there's no avoiding that.
Some levels can be buried, skipped.  Others must be completed before you can
move on.  There really is no way around it.

I know and understand the affect that anxiety and mood triggers can have, and
so here is your fair trigger warning: this is a game about anxiety and
depression.  Those really are the only themes, because that's the purpose this
project is serving for me: putting into words and actions those supremely
liminal states.  As with those themes, death, self-harm, and suicide have their
roles, however brief.

    window.overlay.activate(true)

    $('#complete-level').click () ->
      if window.game.currentLevel == -1
        window.game.next()
        $(this).html 'Complete Level'
      else
        if window.game.hashEnabled
          window.game.levels[window.game.currentLevel].levelComplete = true
        window.game.levels[window.game.currentLevel].complete()
