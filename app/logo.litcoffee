Logo
====

I'm sure this could have just as easily been done as an animated gif, but for
some reason, I felt that wouldn't be complete enough, wouldn't necessarily have
gotten across the randomness and unpredictability of anxiety.  Maybe I just
have a thing for completeness, too.  There's something to be said, after all,
for starting a project meant to express some sort of unique take on a personal
issue, and having total control over all aspects of it.

Though, you know, lets not mince words here: control plays a big part of my
life.  So much anxiety and stress revolves around things over which I have no
control, and so much of panic and depression manifests itself as a feeling of
lack of control.  It's the most difficult portion of the management aspect of
this, because at some point, I'm going to have to accept that the number of
things *not* under my control vastlly outnumbers the number of things that are.
Being seen as In Control is certainaly desirable; being able to relinquish
control where it never existed in the first place is certainly a good step
forward, all told.

    logo = d3.select '#logo'
      .append 'g'

    logo.append 'rect'
      .attr
        x: 0
        y: 0
        width: 275
        height: 100
        fill: '#fff'

    logo.append 'text'
      .attr
        x: 0
        y: 75
        height: '100px'
      .text '300.01'
      .on 'click', () ->
        window.Overlay.setUrl '/docs/logo.html'
        window.Overlay.activate()

Logotype is neat and all, but add in some randomness (but just some).

    setInterval () ->
      startY = _.random 10, 75
      moveUp = _.random(1, 2) % 2 == 0
      logo.append 'line'
        .attr
          x1: 0
          x2: 275
          y1: startY
          y2: startY
      .transition()
        .duration _.random(1000, 5000)
        .attr 'y1', if moveUp then 10 else 78
        .attr 'y2', if moveUp then 10 else 78
        .remove()
    , 500
