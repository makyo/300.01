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

