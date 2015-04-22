install:
	go get github.com/jteeuwen/go-bindata/...
	go get github.com/elazarl/go-bindata-assetfs/...
	go-bindata-assetfs public/... templates/...
	go install

development:
	bundle install
	bourbon install --path ./stylesheets
	cd stylesheets && neat install
	bitters install --path ./stylesheets
	sass --watch stylesheets/app.scss:public/assets/css/app.css --style compressed

