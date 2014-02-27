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
        super '1. Obsession over completeness', true, 250, "Psychiatrist
          (an hour's drive away)"

      render: ->
        $('.level .level-inner').append '<input type="text" data-position="bottom"
          data-intro="Enter numbers as they appear on the screen" id="input" />'
        $('#input').focus()
        $('#input').blur () -> this.focus()
        vis = d3.select '.level .level-inner'
          .classed 'level1', true
          .append 'table'
        
        vis.selectAll 'tr'
          .data [0..9]
          .enter()
          .append 'tr'
          .selectAll 'td'
          .data (d) ->
            (r + d * 10 for r in [1..10])
          .enter()
          .append 'td'
          .attr 'id', (d) -> "numbercell-#{ d }"
        @currNumberTop = $(document).height() / 2 - 75
        @currNumberLeft = $(document).width() / 2 - 150

      show: ->
        @startTimer()
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
        d3.select '.level .level-inner'
          .append 'div'
          .attr
            'class': 'currNumber'
            'data-intro': 'This number.  Here.'
            'data-position': 'left'
          .text @currNumber
          .style
            top: "#{ @currNumberTop }px"
            left: " #{ @currNumberLeft }px"
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

All you need to do, really, is type the numbers as they come up on the screen.

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
          $ "#numbercell-#{ @currNumber }"
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
        $ "#numbercell-#{ @currNumber }"
          .text @currNumber
        @currNumber++
        @restart()

      restart: () ->
        _.delay @startTimer, (_.now() - @lastEventTime - @currentDuration) * -1

The longer you go on, the more likely you are to see corruption.  It's like a
thick layer of grease appended to the palms of your hands, spread out over your
scapula, down over your flanks, on the backs of your knees.  All you need to
do is find a way to scrape some of that off, just for a little bit, by finding
the right course of action to fill that need.

      corruptElements: () ->
        (@corruptElement($("#numbercell-#{ d }")) for d in [1..@currNumber])

      corruptElement: (element) ->
        chance = _.random(1, 100)
        if not (chance <= @currNumber)
          return
        corruptions = []
        switch
          when chance % 3 == 0
            corruptions = [
              '&#x30d;', '&#x30e;', '&#x304;', '&#x305;', '&#x33f;', '&#x311;',
              '&#x306;', '&#x310;', '&#x352;', '&#x357;', '&#x351;', '&#x307;',
              '&#x308;', '&#x30a;', '&#x342;', '&#x343;', '&#x344;', '&#x34a;',
              '&#x34b;', '&#x34c;', '&#x303;', '&#x302;', '&#x30c;', '&#x350;',
              '&#x300;', '&#x301;', '&#x30b;', '&#x30f;', '&#x312;', '&#x313;',
              '&#x314;', '&#x33d;', '&#x309;', '&#x363;', '&#x364;', '&#x365;',
              '&#x366;', '&#x367;', '&#x368;', '&#x369;', '&#x36a;', '&#x36b;',
              '&#x36c;', '&#x36d;', '&#x36e;', '&#x36f;', '&#x33e;', '&#x35b;',
              '&#x346;', '&#x31a;'
            ]
            @corruptColor element, "r", chance
          when chance % 5 == 0
            corruptions = [
              '&#x316;', '&#x317;', '&#x318;', '&#x319;', '&#x31c;', '&#x31d;',
              '&#x31e;', '&#x31f;', '&#x320;', '&#x324;', '&#x325;', '&#x326;',
              '&#x329;', '&#x32a;', '&#x32b;', '&#x32c;', '&#x32d;', '&#x32e;',
              '&#x32f;', '&#x330;', '&#x331;', '&#x332;', '&#x333;', '&#x339;',
              '&#x33a;', '&#x33b;', '&#x33c;', '&#x345;', '&#x347;', '&#x348;',
              '&#x349;', '&#x34d;', '&#x34e;', '&#x353;', '&#x354;', '&#x355;',
              '&#x356;', '&#x359;', '&#x35a;', '&#x323;'
            ]
            @corruptColor element, "g", chance
          when chance % 7 == 0
            corruptions = [
              '&#x315;', '&#x31b;', '&#x340;', '&#x341;', '&#x358;', '&#x321;',
              '&#x322;', '&#x327;', '&#x328;', '&#x334;', '&#x335;', '&#x336;',
              '&#x34f;', '&#x35c;', '&#x35d;', '&#x35e;', '&#x35f;', '&#x360;',
              '&#x362;', '&#x338;', '&#x337;', '&#x361;', '&#x489;'
            ]
            @corruptColor element, "b", chance
          when chance % 11 == 0
            element.html '&#x2588'
            return
        corruption = _.sample(corruptions)
        text = element.text().split ''
        text.splice _.random(1, text.length), 0, corruption
        element.html text.join('')

      corruptColor: (element, rgb, chance) ->
        color = d3.rgb element.css('color')
        color[rgb] =  Math.min(color[rgb] + chance, 255)
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
