.PHONY: subfolder

docroot = /Library/WebServer/Documents/bootstrap-test
outside_of_docroot = /Users/sergey/php-bootstrap-outside-docroot

all:	clean php-bootstrap alias subfolder port symlink

php-bootstrap:
	git submodule init
	git submodule update

alias:
	mkdir ${outside_of_docroot}/
	cp index.php ${outside_of_docroot}/
	cp .htaccess ${outside_of_docroot}/
	mkdir ${outside_of_docroot}/php-bootstrap/
	cd php-bootstrap; git archive master | tar -x -C ${outside_of_docroot}/php-bootstrap/

subfolder:
	mkdir ${docroot}/subfolder/
	cp index.php ${docroot}/subfolder/
	mkdir ${docroot}/subfolder/php-bootstrap/
	cd php-bootstrap; git archive master | tar -x -C ${docroot}/subfolder/php-bootstrap/

port:
	ln -s . port

symlink:
	ln -s ${outside_of_docroot}/ symlink

clean:
	rm -rf ${outside_of_docroot}/
	rm -rf ${docroot}/subfolder/
	rm -f symlink 
	rm -f port
