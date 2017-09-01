#!/bin/bash
. config.sh
LOGFILE=$0.$(date +%F-%H:%m:%S).log
# start the server
$POSTGRES_BIN/createdb mydb > $LOGFILE

# load the data, and initialize the index
$POSTGRES_BIN/psql -d mydb < initialize.sql >> $LOGFILE

# add the functions, if any
$POSTGRES_BIN/psql -d mydb < functions.sql >> $LOGFILE
