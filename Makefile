dist: node_modules

devel: node_modules
	python -m SimpleHTTPServer

node_modules:
	npm install

.PHONY: dist devel
