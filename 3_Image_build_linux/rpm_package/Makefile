#--------------------------------------------------------------------- Variables
PRODUCT_BASE = $(product_base)
VERSION = $(version)

#NGINX_BASE = /usr
#NGINX_CONF = /etc
#NGINX_VAR = /var
EXPLODED_FILES = $(CURDIR)/build


#----------------------------------------------------------------------- Targets
default: rpm

.PHONY: clean
clean:
	rm -fr build

.PHONY: check
check:
ifndef product_base
	$(error "product_base" is undefined. Please define it by setting environmental variable "product_base". For example: export product_base=1.20)
endif
ifndef product_base
	$(error product_base is undefined. You can define it by setting environmental variable "product_base". For exampleL export product_base=101)
endif

.PHONY: prepare
prepare:
	mkdir -p $(EXPLODED_FILES)
	tar -xvf nginx_binary_rpm.tar -C $(EXPLODED_FILES)



.PHONY: build
build: prepare
	echo "Building nginxdemo rpm package"
	# create base folders for nginx
	mkdir -p build/buildroot
	mkdir -p build/buildroot/data
	#mkdir -p build/buildroot/$(NGINX_BASE)
	#mkdir -p build/buildroot/$(NGINX_CONF)
	#mkdir -p build/buildroot/$(NGINX_VAR)
	#mkdir -p build/buildroot/data
	#mkdir -p build/buildroot/$(UI_BASE_ML)

	#cp -r $(EXPLODED_FILES)/nginx_binary/usr/* build/buildroot/$(NGINX_BASE)
	#cp -r $(EXPLODED_FILES)/nginx_binary/etc/* build/buildroot/$(NGINX_CONF)
	#cp -r $(EXPLODED_FILES)/nginx_binary/var/* build/buildroot/$(NGINX_VAR)
	cp -r $(EXPLODED_FILES)/nginx_binary/* build/buildroot/


.PHONY: rpm
rpm: build
	rpmbuild -bb                            \
	         --buildroot $(CURDIR)/build/buildroot    \
	         --define="_rpmdir ./build"     \
	         --define="PRODUCT_BASE $(product_base)"  \
	         --define="VERSION $(version)"  \
	         --define="__prefix /"    \
	         --define="_target_os Linux"    \
	         Specfile

