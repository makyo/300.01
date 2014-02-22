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
        super 'Obsessioni over completeness', true, 250, "Psychiatrist (an hour's drive away)"

      render: ->
        @vis = d3.select('.level')
          .append('svg')
          .attr(
            width: '100%'
            height: '100%'
          )
          .append('g')
          .attr(
            x: 0
            y: 0
          )

        timer = d3.svg.arc()

        numbers = @vis.append('g')

        instructionNumber = @vis.append('g')

      complete: ->
        # check if all numbers are filled in
        if true #all filled in
          super
        else
          alert "You're...you're not done yet, though..."

    window.game.addLevel new Level1()
