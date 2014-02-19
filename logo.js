var vis = d3.select('#logo').append('g');

vis.append('text')
  .attr({
    'x': 0,
    'y': 75
  })
  .text('300.01');

var lineFn = _.throttle(function() {
  var startY = _.random(0, 100);
  var moveUp = _.random(1, 2) % 2 === 0;
  vis.append('line')
    .attr({
      'x1': 0,
      'x2': 275,
      'y1': startY,
      'y2': startY,
    })
    .style({
      'fill': 'none',
      'stroke': '#fff',
      'stroke-width': 1
    })
  .transition()
    .duration(startY * 100)
    .attr('y1', moveUp ? 0 : 101)
    .attr('y2', moveUp ? 0 : 101)
    .remove();
  _.defer(lineFn);
}, 250);

lineFn();
