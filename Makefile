# http://semver.org/
VERSION=0.33.0
INSTALL=${HOME}

all:
	cd src/; \
	javac -classpath ".:../lib/jbzip2-0.9.jar" org/usadellab/trimmomatic/*.java; \
	jar cmf ../MANIFEST.MF trimmomatic.jar org/usadellab/trimmomatic/*

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
	find src/org/usadellab/trimmomatic/ -name "*.class" -exec rm -f {} \;
	rm -f src/trimmomatic.jar
