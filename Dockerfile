FROM httpd:2.4

MAINTAINER Daniel Hochleitner <dhochleitner@posteo.de>

# copy scripts
ADD conf/httpd.conf /usr/local/apache2/conf/httpd.conf
ADD scripts /scripts/

# give execution rights
RUN chmod +x /scripts/entrypoint.sh

# expose http port
EXPOSE 80

# entrypoint for dynamic proxy vhosts and starting apache
ENTRYPOINT ["/scripts/entrypoint.sh"]
