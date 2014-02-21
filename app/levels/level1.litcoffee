1. Obsession over completeness
==============================

    class Level1 extends Level
      constructor: ->
        super 'Obsession', true, 250, "Psychiatrist (an hour's drive away)"

      complete: ->
        # check if all numbers are filled in
        if true #all filled in
          super
        else
          alert "You're...you're not done yet, though..."

    window.game.addLevel new Level1()
