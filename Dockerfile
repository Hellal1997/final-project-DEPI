FROM httpd:latest

WORKDIR /Simple_Project

COPY ./comingsoon /usr/local/apache2/htdocs
