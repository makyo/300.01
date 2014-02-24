###

I fully understand that the mechanics of each level are spoiled through the
mechanic of the overlays.  I'm fine with that.  This file contains a bit of
story, though, and although the mechanic is exposed in the overlay, the tension
of the story is held in this file right here.  If you really want to look at
it, go ahead, I guess, but there's really something to be said for the tension
behind a story.  Please consider not reading this file until you've played the
level!  Just a suggestion <3

###






























































###

Are you sure?  I mean, I can hardly stop you! Just...giving you a last chance,
is all.

###
































































###

Alright.

###

text = 1, next = 2, para = 3
theStory =
  # TODO example text for now
  # Type (text, make next level appear, paragraph), Level, Text
  # levels should always increase after each next, except for 0, which will be the base story
  [text, 0, "First thing a happens."]
  [text, 1, "Then thing a.1 happens..."]
  [text, 0, "Then thing b happens..."]
  [next, 1] # the second argument is ignored, might as well use it to show which level
  [text, 2, "then thing b.2 happens..."]
  [text, 3, "then thing b.3 happens..."]
  [text, 0, "and wasnt that weird?"]
  [para]
  [text, 0, "So anyway, there I was..."]
  [next, 2]

