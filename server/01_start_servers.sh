#!/bin/bash
. config.sh

# start the server
$POSTGRES_BIN/postgres -D $DBPATH
