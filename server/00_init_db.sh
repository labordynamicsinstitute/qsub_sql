#!/bin/bash
. config.sh

[[ -d $DBPATH ]] && rm -r -f $DBPATH
$POSTGRES_BIN/initdb -D $DBPATH > $0.$(date +%F-%H:%m:%S).log

# modify the conf

CONF=$DBPATH/postgresql.conf

cp $CONF $CONF.bak
cat $CONF.bak |\
sed ' s/shared_buffers = 128MB/shared_buffers = 4GB/ ;
      s/#synchronous_commit = on/synchronous_commit = off/ ;
      s/#wal_writer_delay = 200ms/wal_writer_delay = 10000ms/ ;
      s/#checkpoint_segments = 3/checkpoint_segments = 64/ ' > $CONF

