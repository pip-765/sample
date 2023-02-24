FROM centos:centos7

WORKDIR /root

# install RPMs
## netstat, nslookup
RUN yum install -y net-tools bind-utils
## httpd
RUN yum install -y httpd httpd-devel

# config
#ADD httpd.conf /etc/httpd/conf/
ADD proxy.conf /etc/httpd/conf.d/

# ログ
RUN ln -s /dev/stdout /var/log/httpd/error_log

# 実行
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
