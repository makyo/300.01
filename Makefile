LIBRARIES = node_modules/d3/d3.min.js node_modules/jquery/dist/jquery.min.js node_modules/underscore/underscore-min.js node_modules/backbone/backbone-min.js

FILES = src/app.js src/logo.js src/levels/level1.js

dist: build
	rm -rf dist
	mkdir dist
	node_modules/uglify-js/bin/uglifyjs \
		$(FILES) -m --screw-ie8 -o dist/_app.js
	paste -s -d '\n' $(LIBRARIES) dist/_app.js > dist/app.js
	rm dist/_app.js
	cp src/style.css dist
	sed -En '1h;1!H;$${g;s/<!--devel:css-->.*<!--prod(.*)\/prod-->.*<!--\/devel:css-->/\1/g;p;}' index.html |\
		sed -En '1h;1!H;$${g;s/<!--devel:js-->.*<!--prod(.*)\/prod-->.*<!--\/devel:js-->/\1/g;p;}' > dist/index.html
	cp -R docs dist

devel: node_modules
	@node_modules/coffee-script/bin/coffee -o src/ -cw app/&
	python -m SimpleHTTPServer

build: coffee less docco

coffee: node_modules
	node_modules/coffee-script/bin/coffee -o src/ -c app/

less: node_modules
	node_modules/less/bin/lessc style.less > src/style.css

docco: node_modules
	node_modules/docco/bin/docco app/*.litcoffee app/levels/*.litcoffee

node_modules:
	npm install

.PHONY: build coffee devel dist docco less
