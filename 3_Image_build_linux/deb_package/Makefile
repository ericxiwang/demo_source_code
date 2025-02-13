#!/usr/bin/make -f
# -*- makefile -*-
#--------------------------------------------------------------------- Variables

CUSTOMER_ID = $(customer)
DEB_VERSION = $(version)
PRODUCT_BASE = $(product_base)
SERVER_BASE = /opt/$(PRODUCT_BASE)
DATA_BASE = /data/$(PRODUCT_BASE)
STANDALONE_BASE = /opt/standalone
STANDALONE_DATA = /data/standalone
UI_BASE = /usr/share/nginx/html/dist
EXPLODED_FILES = `pwd`/build

default: deb
.PHONY: clean

clean:
	rm -rf build

.PHONY: prepare
prepare:
	mkdir -p $(EXPLODED_FILES)
	mkdir -p $(EXPLODED_FILES)/dist
	unzip  `pwd`/BACKEND-*.zip -d $(EXPLODED_FILES)
	tar -xvf `pwd`/standalone-*.tar.gz -C $(EXPLODED_FILES)
	tar -xvf `pwd`/GUI.tar.gz -C $(EXPLODED_FILES)/.
	cp -r `pwd`/DEBIAN $(EXPLODED_FILES)

	sed -i s/"deb_version"/$(DEB_VERSION)/g $(EXPLODED_FILES)/DEBIAN/control



.PHONY: build
build: prepare
	echo "build deb package"
	mkdir -p build/buildroot/$(SERVER_BASE)
	mkdir -p build/buildroot/$(UI_BASE)
	mkdir -p build/buildroot/$(DATA_BASE)/fonts
	mkdir -p build/buildroot/$(DATA_BASE)/conf

	# ========== new part for standalone ==============
	mkdir -p build/buildroot/$(STANDALONE_BASE)
	mkdir -p build/buildroot/$(STANDALONE_DATA)/conf
	# ===========      standalone end      ============

	mkdir -p build/buildroot/preserve/logs
	mkdir -p build/buildroot/usr/lib/systemd/system/
	cp -r $(EXPLODED_FILES)/$(PRODUCT_BASE)-*/* build/buildroot/$(SERVER_BASE)/

	##################### standalone #############
	cp -r $(EXPLODED_FILES)/standalone/* build/buildroot/$(STANDALONE_BASE)/
	##################### end ####################

	#copy all file from unzipped package to buildroot

	mv build/buildroot/$(SERVER_BASE)/conf/smartworld.conf build/buildroot/$(DATA_BASE)/conf
	mv build/buildroot/$(SERVER_BASE)/conf/$(PRODUCT_BASE).service build/buildroot/usr/lib/systemd/system/

	# ============= standalone ===========
	cp build/buildroot/$(STANDALONE_BASE)/conf/*.conf build/buildroot/$(STANDALONE_DATA)/conf
	mv build/buildroot/$(STANDALONE_BASE)/conf/*.service build/buildroot/usr/lib/systemd/system/
	# ============== standalone end ============

	cp -r $(EXPLODED_FILES)/dist/* build/buildroot/$(UI_BASE)/

	cp -r $(EXPLODED_FILES)/DEBIAN build/buildroot/
.PHONT: deb
deb: build
	dpkg -b `pwd`/build/buildroot skyeye.$(PRODUCT_BASE).$(DEB_VERSION).deb
