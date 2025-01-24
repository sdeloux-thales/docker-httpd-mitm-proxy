FROM httpd:2.4

MAINTAINER Daniel Hochleitner <dhochleitner@posteo.de>

# copy scripts
ADD conf/httpd.conf /usr/local/apache2/conf/httpd.conf
ADD scripts /scripts/

# give rights
RUN chmod +x /scripts/entrypoint.sh
RUN chmod -R 777 /usr/local/apache2/conf/

# expose http port
EXPOSE 8080

# entrypoint for dynamic proxy vhosts and starting apache
ENTRYPOINT ["/scripts/entrypoint.sh"]
