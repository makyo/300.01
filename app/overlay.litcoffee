Overlay
=======

300.01 is an experiential game about anxiety and depression, as well as an
experiment in mixed-media art, including visual, written, and programmatic
aspects.  I want to put this down somewhere just so that it's out in the open,
and I'm not quite sure where is best, you know?  It really fits in with my
sense of completeness, however: if I'm going to make a project like this, I
feel that it needs to be complete.  Part of that also fits in with the
overwhelming desire to explain every action that I take so that everything I do
is defensible.  It's sort of like abdominal guarding - where you tense up your
abdomen in order to protect against a real or perceived threat (it's one of the
signs of peritonitis, I can tell you that much) - I feel like I need to be read
with a guard of words, language, and explanation surrounding my every
expression lest I have to testify as to what I feel to be the correctness of my
actions.

That's the point of the overlays.  Or, rather, that's the point of this attempt
at using literate CoffeeScript to mix the mediums of written work and code, and
the overlays are the way in which I can make that visible to someone outside of
the GitHub project.  It's a game, sure, but it's also an attempt to organize
thoughts into a coherent story, following the history of a diagnosis and the
subsequent treatment of mental illness.  Both sides of that - the experience
and the story - should be told, even if only for my personal benefit.

    class Overlay
      constructor: (@el) ->
        @active = false
        @url = ''
        $ '.close'
          .first()
          .on 'click', _.bind(@deactivate, this)

      setUrl: (@url) ->
        $ 'iframe'
          .first()
          .attr
            src: @url

      toggle: () ->
        if @active then @deactivate() else @activate()

      activate: () ->
        @el.addClass 'active'
        window.dispatcher.trigger 'overlayOpened'

      deactivate: () ->
        @el.removeClass 'active'
        window.dispatcher.trigger 'overlayClosed'

All source for this game is available on <a
href="https://github.com/makyo/300.01" target="_top">GitHub</a>. See the README
file there for credits and more info. 

    window.overlay = new Overlay $('#overlay')
