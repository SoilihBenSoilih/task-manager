.PHONY: all

all: init install-scripts start-server

init:
	npm init -y
	npm install browser-sync --save-dev

install-scripts:
	jq 'del(.scripts) + { "scripts": { "start": "browser-sync start --server --files \"*.css, *.html\"", "dev": "browser-sync start --server --files \"*.css, *.html\" --startPath \"index.html\"" } }' package.json > temp.json
	mv temp.json package.json
start-server:
	npm start
