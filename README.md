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
    * J.C.
    * R.R.
    * C.M.
    * J.C.
    * K.K.
    * K.B.
    * K.S.
    * G.P.
    * Dr. &#x2588;.&#x2588;.
