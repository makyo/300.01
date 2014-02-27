300.01
======

An experiential game about mental health.  While the game itself is not ready
for play, it will be available [here](http://300.01.drab-makyo.com).

This README is necessarily sparse.  The game is written in literate
CoffeeScript, and thus most of the information is available there.  However, all
of that is available in the game itself through an overlay.

## The Source

300.01 is a single-page CoffeeScript application consisting of a game, several
levels, an overlay, and a few extras.  If you want to run the game in
development mode, simply run `make devel` from the root directory of the source.
This will run both a simple HTTP server on port 8000 and also ensure that the
CoffeeScript source is updated.  The LESS stylesheet is rendered within the
browser in this mode.  The only files that are not kept up to date with a
watcher are the rendered .litcoffee files, but you can run `make docco` at any
time without pausing the development environment to regenerate those.

The application is distributed as a single JavaScript file containing all
libraries and the compiled/minimized/mangled game.  The LESS is compiled down
into CSS and merged with other necessary stylesheets to minimize requests.  You
can prepare for distribution by running `make dist` which will build all the
files necessary in the dist/ directory.

There are a few other make targets which really aren't that useful in day-to-day
development, but feel free to check out the Makefile for more.

## Contributing

I aim to release this one level at a time.  Each level is exhausting to produce,
and I burned too hard and too long to get the game itself and the first two
levels done in just a few days.  However, I definitely welcome additions from
others out there who might find this sort of thing useful.  Send a PR or shoot
me an email - makyo@drab-makyo.com

I'm also on [Gittip](https://www.gittip.com/makyo/)

## Acknowledgements

* Libraries
    * [Backbone](http://backbonejs.org/)
    * [Chardin.js](https://github.com/heelhook/chardin.js)
    * [(Literate) CoffeeScript](http://coffeescript.org/)
    * [D3](http://d3js.org/)
    * [Docco](http://jashkenas.github.io/docco/)
    * [JQuery](http://jquery.com/)
    * [Underscore](http://underscorejs.org)
* People
    * J.C&#x30d;.
    * R.R.
    * C&#x330;&#x334;.M.
    * J.C&#x359;.
    * K&#x302;.K&#x341;.
    * K&#x342;&#x307;.B&#x363;&#x32a;&#x35d;.
    * K&#x304;&#x360;&#x344;.S&#x309;&#x356;&#x321;&#x333;.
    * G&#x313;&#x34c;&#x36b;&#x30f;.P&#x310;&#x309;&#x317;&#x337;&#x35f;.
    * Dr. &#x2588;.&#x2588;.
