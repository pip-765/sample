FROM centos:centos7

WORKDIR /root

# install RPMs
## netstat, nslookup
RUN yum install -y net-tools bind-utils
## httpd
RUN yum install -y httpd httpd-devel
## jq
RUN curl -L -o /usr/bin/jq https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64 && chmod 755 /usr/bin/jq

RUN yum clean all

# config
#ADD httpd.conf /etc/httpd/conf/

# コンテンツ
ADD htdocs/*        /var/www/html/

# ログ
RUN ln -s /dev/stdout /var/log/httpd/error_log

# 実行
ADD entrypoint.sh /root/
RUN chmod 755 /root/entrypoint.sh
CMD ["/root/entrypoint.sh"]
#CMD ["/usr/sbin/apachectl", "-D", "FOREGROUND"]
