FROM centos:7.2.1511
MAINTAINER Vincent FENET <vincent@fenet.fr>

RUN yum install -y yum-plugin-ovl && yum clean all
ADD ./dnf-stack-el7.repo /etc/yum.repos.d/dnf-stack-el7.repo
RUN yum -y install wget sudo openssh-server git xinetd socat make dos2unix httpd nano elinks pytz glibc.i686 zip unzip cpanminus which file mailx mutt bind-utils vim python2 python-pip python-virtualenv dnf samba samba-client expect libxml2-devel libxslt-devel && yum -y group install "Development Tools" && yum clean all
RUN rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
ADD ./pycharm.repo /etc/yum.repos.d/pycharm.repo
RUN yum -y install pycharm-community && yum clean all
RUN yum -y install x2goserver && yum clean all
RUN yum -y groupinstall mate && yum clean all
RUN yum -y reinstall glibc-common && yum clean all

RUN yum -y install mariadb-server mariadb-devel && yum clean all
RUN rpm -ivh https://dev.mysql.com/get/mysql57-community-release-el7-11.noarch.rpm && yum -y install mysql-workbench && yum clean all
RUN curl -v -j -k -L -H "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.rpm > jdk-8u131-linux-x64.rpm && rpm -ivh jdk-8u131-linux-x64.rpm && rm -f *.rpm
RUN bash -c "echo 2 | alternatives --config java && yum clean all"
RUN yum -y update libstdc++ && yum -y install libstdc++.i686 compat-libtiff3 && yum clean all
RUN yum -y install maven && yum clean all

