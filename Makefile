dist: build
	rm -rf dist
	mkdir dist
	node_modules/uglify-js/bin/uglifyjs `find src -name *.js` -m --screw-ie8 -o dist/app.js
	cp src/style.css dist
	sed -En '1h;1!H;$${g;s/<!--devel:css-->.*<!--prod(.*)\/prod-->.*<!--\/devel:css-->/\1/g;p;}' index.html |\
		sed -En '1h;1!H;$${g;s/<!--devel:js-->.*<!--prod(.*)\/prod-->.*<!--\/devel:js-->/\1/g;p;}' > dist/index.html

devel: node_modules
	@node_modules/coffee-script/bin/coffee -o src/ -cw app/&
	python -m SimpleHTTPServer

build: coffee less

coffee: node_modules
	node_modules/coffee-script/bin/coffee -o src/ -c app/

less: node_modules
	node_modules/less/bin/lessc style.less > src/style.css

node_modules:
	npm install

.PHONY: build coffee devel dist less
