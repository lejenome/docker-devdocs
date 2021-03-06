FROM ubuntu:14.04
MAINTAINER Moez Bouhlel "bmoez.j@gmail.com"

RUN locale-gen "en_US.UTF-8"
ENV LANG "en_US.UTF-8"
ENV LANGUAGE "en_US.UTF-8"
ENV LC_ALL "en_US.UTF-8"
ENV DEBIAN_FRONTEND noninteractive
RUN dpkg-reconfigure locales

RUN apt-key adv --recv-keys --keyserver keyserver.ubuntu.com C3173AA6 && \
	echo deb http://ppa.launchpad.net/brightbox/ruby-ng/ubuntu trusty main > /etc/apt/sources.list.d/ruby.list
RUN apt-get update && \
	apt-get dist-upgrade -y --force-yes && \
	apt-get install -y ruby2.2 ruby2.2-dev nodejs make libcurl3 git build-essential zlib1g-dev && \
	gem install bundler

RUN git clone https://github.com/Thibaut/devdocs.git /app
WORKDIR /app

RUN bundle install
RUN thor docs:download --all
RUN apt-get remove -y --purge make git build-essential git-man libcurl3-gnutls libedit2 liberror-perl libx11-6 libx11-data libxau6 libxcb1 fakeroot g++ g++-4.8 libalgorithm-diff-perl libalgorithm-diff-xs-perl libalgorithm-merge-perl libdpkg-perl libfakeroot libfile-fcntllock-perl libtimedate-perl libxdmcp6 patch rsync  linux-libc-dev manpages manpages-dev patch libc-dev-bin libc6-dev libgcc-4.8-dev libstdc++-4.8-dev cpp cpp-4.8 libasan0 libatomic1 libcloog-isl4 libgomp1 libisl10 libitm1 libmpc3 libmpfr4 libquadmath0 libtsan0 libroken18-heimdal krb5-locales libgssapi-krb5-2 libheimbase1-heimdal libidn11 libk5crypto3 libkeyutils1 libkrb5-3 libkrb5support0 librtmp0 libsasl2-2 libsasl2-modules libsasl2-modules-db && \
	apt-get autoremove -y && \
	apt-get clean -y && \
	rm -rf /var/lib/apt/lists/*


EXPOSE 9292
CMD ["rackup"]
