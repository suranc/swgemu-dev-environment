#!/bin/sh

export DBUSER=swgemu
export DBNAME=swgemu
export DBPASS=123456

mysql -v <<-EOF
        SET @@SESSION.SQL_LOG_BIN=0;
        DELETE FROM mysql.user WHERE user NOT IN ('mysql.sys', 'mariadb.sys', 'mysqlxsys', 'root') OR host NOT IN ('localhost') ;
        SET PASSWORD FOR 'root'@'localhost' = PASSWORD('${DBPASS}');
        GRANT ALL ON *.* TO 'root'@'localhost' WITH GRANT OPTION;
        CREATE USER 'root'@'%' IDENTIFIED BY '${DBPASS}';
        GRANT ALL ON *.* TO 'root'@'%' WITH GRANT OPTION;
        CREATE USER '${DBUSER}'@'%' IDENTIFIED BY '${DBPASS}';
        GRANT ALL ON \`${DBNAME}\`.* TO '${DBUSER}'@'%' WITH GRANT OPTION;
        DROP DATABASE IF EXISTS test;
        FLUSH PRIVILEGES;
EOF

mysql /work/Core3/MMOCoreORB/sql/swgemu.sql