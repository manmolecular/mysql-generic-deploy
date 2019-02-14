FROM ubuntu:latest

COPY distro /usr/local
WORKDIR /usr/local
RUN apt-get update && apt-get install xz-utils libaio1 libaio-dev libnuma-dev openssl -y

RUN groupadd mysql
RUN useradd -r -g mysql -s /bin/false mysql
RUN mkdir mysql-dir
RUN tar zxvf *.gz -C mysql-dir && rm -f *.xz *.gz *.tar
RUN ln -s mysql-dir/mysql* mysql

WORKDIR /usr/local/mysql
RUN mkdir mysql-files
RUN chown mysql:mysql mysql-files
RUN chmod 750 mysql-files

RUN ./bin/mysqld --no-defaults --initialize-insecure --user=mysql --basedir=. --skip-name-resolve --skip-host-cache --bind-address=0.0.0.0
RUN ./bin/mysql_ssl_rsa_setup
USER mysql

EXPOSE 3306
ENTRYPOINT ["./bin/mysqld"]