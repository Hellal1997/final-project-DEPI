FROM httpd:latest


COPY ./commingsoon /usr/local/apache2/htdocs


COPY kubernetes/target/kubernetes-1.0-AMIT.war /usr/local/tomcat/webapps/kubernetes-1.0-AMIT.war
