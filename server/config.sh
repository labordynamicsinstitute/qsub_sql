# PATH TO POSTGRES
POSTGRES=/usr/pgsql-9.3/
POSTGRES_BIN=${POSTGRES}/bin
export PATH=$POSTGRES_BIN:$PATH
export LD_LIBRARY_PATH=$POSTGRES/lib

# PATH TO STORAGE
DBPATH=/scratch/lv39_0002/test/pgsql

# permissions
umask 007




