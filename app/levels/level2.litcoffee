2. Obsession over fractal detail
================================

Write out the story as it appears.

Exactly.

    class Level2 extends Level
      constructor: (@story) ->
        @currVisible = 0
        super 'Obsession over fractal detail', true, 200, 'A suicide attempt,
          and a new prescription when Clonazepam does not work out.'

      render: ->
        @textEl = d3.select '.level .level-inner'
          .classed 'level2', true
          .append 'div'
          .classed 'pure-u-15-24', true
          .append 'p'
          .classed 'text', true
          .attr
            'data-position': 'bottom'
            'data-intro': 'Type this story...'
        _(@story).each((line, index) =>
          line.id = "line-#{ index }"
          classes = "line textlevel-#{ line.level }
            #{ if line.level > 0 then ' hidden' else '' }"
          @textEl.append 'span'
            .attr
              class: classes
              id: line.id
            .text line.text
        )
        @inputEl = d3.select '.level .level-inner'
          .append 'div'
          .classed 'pure-u-1-3 input-wrapper', true
          .append 'textarea'
          .attr
            id: 'input'
            'data-position': 'bottom'
            'data-intro': '...in here.'
          .on 'keyup', => @check()
        d3.select '#cost'
          .attr 'data-position', 'left'
        return

      complete: ->
        if @levelComplete
          super
        else
          alert "The story is not yet finished."

Write out the story as it appears.  Sometimes this is easier said than done
because the story as it occurs in our heads is not a linear thing.  It's more
fractal.  With each cycle over it, more and more detail is added, and not
always to the benefit of the story or the storyteller.  The problem is that
there's no way out but through.  You have to write out the story as it appears.

Exactly.

      check: () ->
        currInputs = @inputEl.node().value.split  /\.\s*/
          .map (input) ->
            input.replace(/([\.\\\^\$\*\?\[\]\(\)])/g, "\\$1")
              .replace(/\s+/, ' ')
        _.chain(@story)
          .filter((line) =>
            return line.level <= @currVisible and not line.complete
          ).each((line) =>
            _.each(currInputs, (currInput) =>
              match = line.text.match currInput
              if match
                if "#{ match[0] }." == line.text
                  line.complete = true
                  d3.select "##{ line.id }"
                    .classed "complete", true
                  if _.filter(@story, (d) -> ( d.complete )).length == @story.length
                    @levelComplete = true
                  if line.next
                    @revealMore()
                else if line.text.search(currInput) == 0
                  d3.select "##{ line.id }"
                    .html line.text.replace(match[0],
                      """<span class="complete">#{ match[0] }</span>""")
            )
          )

Write out the story as it appears.  The more you write, the more story there is
to write.  Sometimes this is easier said than done because the story as it
occurs in our heads is not a linear thing.  It's more fractal.  The detail is
intense, but there's always more to find.  With each cycle over it, more and
more detail is added, and not always to the benefit of the story or the
storyteller.  The problem is that there's no way out but through.  The story is
all consuming and unavoidable.  You have to write out the story as it appears.

Exactly.  Precisely as it appears.

      revealMore: () ->
        if @levelComplete
          return
        @currVisible++
        @textEl.selectAll ".textlevel-#{ @currVisible }"
          .classed 'hidden', false

*Here is where that trigger warning kicks in: suicidal ideation, self harm.  It
is okay to leave &hearts;*

    window.game.addLevel new Level2(window.aStoryAboutDogs)
