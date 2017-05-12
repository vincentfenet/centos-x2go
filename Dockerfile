FROM centos:7.2.1511
MAINTAINER Vincent FENET <vincent@fenet.fr>

RUN yum install -y yum-plugin-ovl && yum clean all
ADD ./dnf-stack-el7.repo /etc/yum.repos.d/dnf-stack-el7.repo
RUN yum -y install wget sudo openssh-server git xinetd socat make dos2unix httpd nano elinks pytz glibc.i686 zip unzip cpanminus which file mailx mutt bind-utils vim python2 python-pip python-virtualenv dnf && yum -y group install "Development Tools" && yum clean all
RUN rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
ADD ./pycharm.repo /etc/yum.repos.d/pycharm.repo
RUN yum -y install pycharm-community && yum clean all
RUN yum -y install x2goserver && yum clean all
RUN yum -y groupinstall mate && yum clean all
RUN yum -y reinstall glibc-common && yum clean all

RUN rpm -ivh https://dev.mysql.com/get/mysql57-community-release-el7-11.noarch.rpm && yum -y install mysql-server mysql-community-devel mysql-workbench && yum clean all
RUN wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u112-b15/jdk-8u112-linux-x64.rpm && rpm -ivh jdk-8u112-linux-x64.rpm && rm *.rpm
