FROM centos:centos7

WORKDIR /root

# install RPMs
## netstat, nslookup
RUN yum install -y net-tools bind-utils
## httpd
RUN yum install -y httpd httpd-devel
## curl, json
RUN yum install -y libcurl-devel jansson-devel
## hiredis, cjose
ADD *.rpm ./
#RUN curl -L -o cjose-0.6.1.5-2.el7.x86_64.rpm https://github.com/zmartzone/mod_auth_openidc/releases/download/v2.4.0/cjose-0.6.1.5-2.el7.x86_64.rpm
RUN yum install -y hiredis-0.12.1-1.el7.centos.x86_64.rpm cjose-0.6.1.5-2.el7.x86_64.rpm
## mod_auth_openidc
#RUN curl -L -o mod_auth_openidc-2.4.12.3-1.el7.x86_64.rpm https://github.com/zmartzone/mod_auth_openidc/releases/download/v2.4.12.3/mod_auth_openidc-2.4.12.3-1.el7.x86_64.rpm
RUN yum install -y mod_auth_openidc-2.4.12.3-1.el7.x86_64.rpm
## timezone
RUN yum install -y tzdata
RUN ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

RUN yum clean all

# config
ADD oidc.conf /etc/httpd/conf.d/

# コンテンツ
ADD htdocs/*      /var/www/html/
ADD htdocs/auth   /var/www/html/auth/

# ログ
RUN ln -s /dev/stdout /var/log/httpd/error_log

# 実行
WORKDIR /etc/httpd
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
