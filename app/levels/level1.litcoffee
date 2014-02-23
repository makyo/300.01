1. Obsession over completeness
==============================

Write the numbers 1 through 100.

Do not write them too fast.

Do not write them too slow.

Do not worry about what you see.

Do not worry about what you see.

Do not worry about what you see.

Write the numbers 1 through 100.

Do not write them too fast.

Do not write them too slow.

Do not worry about what you see.

    class Level1 extends Level
      constructor: ->
        @currNumber = 1
        super '1. Obsession over completeness', true, 250, "Psychiatrist (an hour's drive away)"

      render: ->
        $('.level').text "Please enter the numbers as they appear on the screen: "
        $('.level').append '<input type="text" id="input" />'
        $('#input').focus()
        $('#input').blur () -> this.focus
        vis = d3.select '.level'
          .append 'table'
          .style
            width: '100%'
            height: '100%'
        
        vis.selectAll 'tr'
          .data [0..9]
          .enter()
          .append 'tr'
          .selectAll 'td'
          .data (d) ->
            (r + d * 10 for r in [1..10])
          .enter()
          .append 'td'
          .style
            width: '10%'
            height: '10%'
          .attr 'data-number', (d) -> d
        @currNumberTop = $(document).height() / 2 - 75
        @currNumberLeft = $(document).width() / 2 - 150
        @startTimer()

      show: ->
        return

      complete: ->
        if @levelComplete
          super
        else
          alert "You're...you're not done yet, though..."

      startTimer: =>
        $('#input').off 'keypress.comeOn'
        if @levelComplete or @currNumber == 101
          @levelComplete = true
          return
        _.defer () ->
          $('#input').val('')
        @currNumberString = ''
        @lastEventTime = _.now()
        @currentDuration = 2000 + _.random(-500, 500)
        d3.select '.level'
          .append 'div'
          .attr 'class', 'currNumber'
          .text @currNumber
          .style
            position: 'absolute'
            width: '300px'
            height: '300px'
            top: "#{ @currNumberTop }px"
            left: " #{ @currNumberLeft }px"
            'text-align': 'center'
            font: '150px "Walter Turncoat"'
            opacity: 1
          .transition()
          .duration @currentDuration
          .style 'opacity', 0
          .each 'end', () =>
            if @currNumberString == ''
              _.defer =>
                d3.selectAll '.currNumber'
                  .remove()
                @startTimer()
        $ '#input'
          .on 'keypress.comeOn', (evt) =>
            result = @onKeyPress(evt)
            if result == 1
              now = _.now()
              diff = now - @lastEventTime
              quartile = @currentDuration / 4
              if diff < quartile
                @tooSoon()
              else if diff > quartile * 3
                @tooLate()
              else
                @onTime()
            else if result == 0
              @restart()

All you need to do, really, is type the nubers as they come up on the screen.

      onKeyPress: (evt) =>
        currKeyPress = evt.which - 48 *
          (if evt.ctrlKey or evt.metaKey or evt.shiftKey or evt.altKey then 100 else 1)
        if 9 >= currKeyPress >= 0
          @currNumberString += "#{ currKeyPress }"
          if parseInt(@currNumberString) == @currNumber
            return 1
          else
            if parseInt(@currNumberString) > @currNumber
              $('#input').val ''
              @currNumberString = ''
              return 0
            else
              return -1
        else
          evt.preventDefault()
          return 0

Gotta be a little faster on the draw...

      tooLate: () ->
        if @currNumber > 1
          @currNumber--
          $ "[data-number=#{ @currNumber }]"
            .text ''
          @corruptElements()
        @restart()

Okay, no, but really, not that fast...

      tooSoon: () ->
        @corruptElements()
        @restart()

See, you have a window of opportunity to sate that feeling, get rid of that
stench of ritual, the acrid tang of omen and portent...

      onTime: () ->
        @corruptElements()
        $ "[data-number=#{ @currNumber }]"
          .text @currNumber
        @currNumber++
        @restart()

      restart: () ->
        _.delay @startTimer, (_.now() - @lastEventTime - @currentDuration) * -1

The longer you go on, the more likely you are to see corruption.  It's like a
thick layer of grease appended to the palms of your hands, spread out over your
scapula, down over your flanks, on the backs of your kneeds.  All you need to
do is find a way to scrape some of that off, just for a little bit, by finding
the right course of action to fill that need.

      corruptElements: () ->
        (@corruptElement($("[data-number=#{ d }]")) for d in [1..@currNumber])

      corruptElement: (element) ->
        if not (_.random(1, 100) <= @currNumber * 2)
          return
        direction = _.random(1, 10)
        corruptions = []
        switch
          when direction in [1, 4, 7]
            corruptions = [
              '\u030d', '\u030e', '\u0304', '\u0305', '\u033f', '\u0311',
              '\u0306', '\u0310', '\u0352', '\u0357', '\u0351', '\u0307',
              '\u0308', '\u030a', '\u0342', '\u0343', '\u0344', '\u034a',
              '\u034b', '\u034c', '\u0303', '\u0302', '\u030c', '\u0350',
              '\u0300', '\u0301', '\u030b', '\u030f', '\u0312', '\u0313',
              '\u0314', '\u033d', '\u0309', '\u0363', '\u0364', '\u0365',
              '\u0366', '\u0367', '\u0368', '\u0369', '\u036a', '\u036b',
              '\u036c', '\u036d', '\u036e', '\u036f', '\u033e', '\u035b',
              '\u0346', '\u031a'
            ]
            @corruptColor element, "r"
          when direction in [2, 5, 8]
            corruptions = [
              '\u0316', '\u0317', '\u0318', '\u0319', '\u031c', '\u031d',
              '\u031e', '\u031f', '\u0320', '\u0324', '\u0325', '\u0326',
              '\u0329', '\u032a', '\u032b', '\u032c', '\u032d', '\u032e',
              '\u032f', '\u0330', '\u0331', '\u0332', '\u0333', '\u0339',
              '\u033a', '\u033b', '\u033c', '\u0345', '\u0347', '\u0348',
              '\u0349', '\u034d', '\u034e', '\u0353', '\u0354', '\u0355',
              '\u0356', '\u0359', '\u035a', '\u0323'
            ]
            @corruptColor element, "g"
          when direction in [3, 6, 9]
            corruptions = [
              '\u0315', '\u031b', '\u0340', '\u0341', '\u0358', '\u0321',
              '\u0322', '\u0327', '\u0328', '\u0334', '\u0335', '\u0336',
              '\u034f', '\u035c', '\u035d', '\u035e', '\u035f', '\u0360',
              '\u0362', '\u0338', '\u0337', '\u0361', '\u0489'
            ]
            @corruptColor element, "b"
          else
            if _.random(1, 3) == 1
              element.html '&#x2588'
            return
        corruption = _.sample(corruptions)
        text = element.text().split ''
        text.splice _.random(1, text.length), 0, corruption
        element.text text.join('')

      corruptColor: (element, rgb) ->
        color = d3.rgb element.css('color')
        color[rgb] =  Math.min(color[rgb] + _.random(1, 127), 127)
        element.css 'color', color.toString()

Ready?  Once we get started by closing this overlay, all you need to do is hit
any key, then write the numbers 1 through 100. 

Write the numbers 1 through 100.

Do not write them too fast.

Do not write them too slow.

Do not worry about what you see.

Do not worry about what you see.

Do not worry about what you see.

    window.game.addLevel new Level1()
