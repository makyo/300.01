2. Obsession over fractal detail
================================

Write out the story as it appears.

Exactly.

    class Level2 extends Level
      constructor: (@story) ->
        @currVisible = 0
        super 'Obsession over fractal detail', true, 200, 'A suicide attempt, and a new prescription when Clonazepam does not work out.'

      render: ->
        @textEl = $('.level').addClass 'level2'
          .append '<p class="text"></p>'
        _(@story).each((line) =>
          classes = "textlevel-#{ line.level }#{ " hidden" if line.level > 0 }"
          @textEl.append "<span class=\"#{ classes }\">#{ line.text }</span>  "
        )
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
        @currVisible++
        @textEl.find(".textlevel-#{ @currVisible }").show 'slow'

    window.game.addLevel new Level2(window.aStoryAboutDogs)
