dist: node_modules
	rm -rf dist
	mkdir -p dist/src
	node_modules/coffee-script/bin/coffee -o dist/src -c app
	node_modules/uglify-js/bin/uglifyjs `find dist/src -name *.js` -m --screw-ie8 -o dist/app.js
	rm -rf dist/src
	node_modules/less/bin/lessc style.less > dist/style.css
	sed -En '1h;1!H;$${g;s/<!--devel:css-->.*<!--prod(.*)\/prod-->.*<!--\/devel:css-->/\1/g;p;}' index.html |\
		sed -En '1h;1!H;$${g;s/<!--devel:js-->.*<!--prod(.*)\/prod-->.*<!--\/devel:js-->/\1/g;p;}' > dist/index.html

devel: node_modules
	@node_modules/coffee-script/bin/coffee -o src -cw app&
	python -m SimpleHTTPServer

node_modules:
	npm install

.PHONY: dist devel
