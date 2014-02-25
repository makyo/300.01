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
