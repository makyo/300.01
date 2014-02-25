2. Obsession over fractal detail
================================

Write out the story as it appears.

Exactly.

    class Level2 extends Level
      constructor: ->
        # TODO load the story? Otherwise, just include the source
        super 'Obsession over fractal detail', true, 200, 'A new prescription when Clonazepam does not work out.'

      render: ->
        # TODO draw the paragraphs, each text bit wrapped in a span with the level and index indicated in class; hide everything not level 0
        return

      complete: ->
        return

      onKeyPress: (evt) ->
        # TODO check

      check: () ->
        # for each visible level
        # Check whether completed already, skip if so
        # If not, check if it is now
        # If it is, mark it as such
        # also see if the next line is a 'next' type.  If so, show next level
        # If not, but it partially complete, style accordingly
        # skip otherwise

      revealMore: () ->
        # increment current level
        # find all spans belonging to that level and make them visible/incomplete

    window.game.addLevel new Level2()
