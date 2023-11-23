#!/bin/sh

export DBUSER=swgemu
export DBNAME=swgemu
export DBPASS=123456


mysql < /work/Core3/MMOCoreORB/sql/swgemu.sql

mysql -v <<-EOF
        SET @@SESSION.SQL_LOG_BIN=0;
        GRANT ALL ON *.* TO 'root'@'localhost' WITH GRANT OPTION;
        GRANT ALL ON *.* TO 'root'@'%' WITH GRANT OPTION;
        CREATE USER '${DBUSER}'@'%' IDENTIFIED BY '${DBPASS}';
        GRANT ALL ON \`${DBNAME}\`.* TO '${DBUSER}'@'%' WITH GRANT OPTION;
        DROP DATABASE IF EXISTS test;
        FLUSH PRIVILEGES;
EOF

exit 0