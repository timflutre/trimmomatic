# http://semver.org/
VERSION := 0.33.0
INSTALL := ${HOME}
SOURCES := $(shell find src/ -name "*.java" | sed 's|src/||g')

all:
	rm -rf classes; mkdir -p classes/; \
	cd src/; javac -classpath ".:../lib/jbzip2-0.9.jar" -d ../classes ${SOURCES}; \
	cd ../classes; jar xf ../lib/jbzip2-0.9.jar; \
	jar cmf ../MANIFEST.MF trimmomatic.jar ./

check:
	@echo "this package doesn't have any test (yet)"

install: 
	mkdir -p ${INSTALL}/bin
	cp src/trimmomatic.jar ${INSTALL}/bin/

dist:
	mkdir -p trimmomatic-${VERSION}
	cp AUTHORS Makefile README trimmomatic-${VERSION}
	cp build.xml MANIFEST.MF versionHistory.txt trimmomatic-${VERSION}
	cp -r adapters distSrc lib/ src/ trimmomatic-${VERSION}
	tar -czvf trimmomatic-${VERSION}.tar.gz trimmomatic-${VERSION}/
	rm -rf trimmomatic-${VERSION}

clean:
	rm -rf classes/
