Dispatches from the land of imposter syndrome
=============================================

I can't believe this is the type of thing I spend my time doing.  I can't
believe this is the type of thing I think will help me.  I can't believe this
is the type of thing that others might even remotely enjoy, much less find
valuable.  I can't believe this is the type of thing I waste my time doing.  I
can't believe I spend the effort on things that make me look so bad.  I can't
believe this is the type of thing I want to put out into the world.  I can't
believe there's anything to be gained from such a broken existence.  I can't
believe there's anything within my life worth writing about.  I can't believe
there's anything I've written worth reading, played worth listening to,
programmed worth playing with.

    window.dispatcher = _.clone(Backbone.Events)

    window.dispatcher.on('chardinStart', () ->
      $('#content').chardinJs('start')
    )

    window.dispatcher.on('chardinStop', () ->
      $('#content').chardinJs('stop')
    )

    window.dispatcher.once('overlayClosed', () ->
      window.dispatcher.trigger('chardinStart')
    )

    window.dispatcher.on('overlayOpened', () ->
      window.dispatcher.trigger('chardinStop')
    )
