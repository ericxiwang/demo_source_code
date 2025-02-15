#!/usr/bin/make -f
# -*- makefile -*-
#--------------------------------------------------------------------- Variables

PRODUCT_BASE = $(product_base)
DEB_VERSION = $(version)

EXPLODED_FILES = `pwd`/build
NGINX_BASE = /usr
NGINX_CONF = /etc
NGINX_LIB = /lib
NGINX_VAR = /var

default: deb
.PHONY: clean

clean:
	rm -rf $(EXPLODED_FILES)


.PHONY: check
check:
ifndef product_base
	$(error "product_base" is undefined. Please define it by setting environmental variable "product_base". For example: export product_base=1.20)
endif
ifndef version
	$(error "version" is undefined. You can define it by setting environmental variable "version". For exampleL export version=25)
endi

.PHONY: prepare
prepare:
	mkdir -p $(EXPLODED_FILES)
	tar -xvf nginx_binary.tar -C $(EXPLODED_FILES)
	sed -i s/"deb_version"/$(DEB_VERSION)/g $(EXPLODED_FILES)/DEBIAN/control



.PHONY: build
build: prepare
	echo "build deb package"
	mkdir -p build/buildroot/$(NGINX_BASE)
	mkdir -p build/buildroot/$(NGINX_CONF)
	mkdir -p build/buildroot/$(NGINX_LIB)
	mkdir -p build/buildroot/$(NGINX_VAR)

	cp -r $(EXPLODED_FILES)/nginx_binary/usr/* build/buildroot/$(NGINX_BASE)
	cp -r $(EXPLODED_FILES)/nginx_binary/etc/* build/buildroot/$(NGINX_CONF)
	cp -r $(EXPLODED_FILES)/nginx_binary/lib/* build/buildroot/$(NGINX_LIB)
	cp -r $(EXPLODED_FILES)/nginx_binary/var/* build/buildroot/$(NGINX_VAR)


.PHONT: deb
deb: build
	dpkg -b `pwd`/build/buildroot nginxdemo.$(PRODUCT_BASE).$(DEB_VERSION).deb
