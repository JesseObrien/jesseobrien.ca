build:
	go get github.com/jteeuwen/go-bindata/...
	go get github.com/elazarl/go-bindata-assetfs/...
	sass stylesheets/app.scss:public/assets/css/app.css --style compressed
	go-bindata-assetfs public/... templates/...

install:
	@make build
	go install

dep_install:
	bundle install
	bourbon install --path ./stylesheets
	cd stylesheets && neat install
	bitters install --path ./stylesheets

development:
	@$(MAKE) dep_install
	sass --watch stylesheets/app.scss:public/assets/css/app.css --style compressed


