FROM almalinux:8
LABEL maintainer="basavab413@gmail.com"

RUN dnf install -y httpd unzip zip && dnf clean all

ADD https://www.free-css.com/assets/files/free-css-templates/dowmload/page285/viking.zip /var/www/html/

WORKDIR /var/www/html/

RUN unzip viking.zip && \
    cp -rvf viking/* . && \
    rm -rf viking viking.zip

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]

EXPOSE 80 
