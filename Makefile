IMAGE = sunaoka/php:$(VERSION)-alpine

all: 5.5 5.6 7.0 7.1 7.2 7.3 7.4 8.0

5.5: build-5.5.38
5.6: build-5.6.40
7.0: build-7.0.33
7.1: build-7.1.33
7.2: build-7.2.34
7.3: build-7.3.29
7.4: build-7.4.22
8.0: build-8.0.9

build-%:
	$(eval VERSION := $*)
	docker build -t $(IMAGE) "$(CURDIR)/$(VERSION)" --progress=plain
	docker run -it --rm $(IMAGE) php -v

distclean:

.PHONY: all 5.5 5.6 7.0 7.1 7.2 7.3 7.4 8.0 distclean
