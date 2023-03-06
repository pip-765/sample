FROM centos:centos7

WORKDIR /etc/httpd

# install RPMs
## netstat, nslookup
RUN yum install -y net-tools bind-utils
## httpd
RUN yum install -y httpd httpd-devel mod_ssl

# config
#ADD httpd.conf /etc/httpd/conf/
ADD *.conf /etc/httpd/conf.d/
ADD server.crt /etc/httpd/conf/
ADD server.key /etc/httpd/conf/

# ログ
RUN ln -s /dev/stdout /var/log/httpd/error_log
#RUN ln -s /dev/stdout /var/log/httpd/logs/ssl_request_log

# 実行
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
