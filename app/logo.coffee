logo = d3.select('#logo').append('g')

logo.append('text')
  .attr(
    x: 0
    y: 75
  )
  .text('300.01')

lineFn = _.throttle(() ->
  startY = _.random(10, 75)
  coinToss = _.random(1, 2) % 2 == 0
  logo.append('line')
    .attr(
      x1: 0
      x2: 275
      y1: startY
      y2: startY
    )
  .transition()
    .duration(_.random(1000, 10000))
    .attr('y1', if coinToss then 10 else 78)
    .attr('y2', if coinToss then 10 else 78)
    .remove()
  _.defer(lineFn)
, 250)

lineFn()
