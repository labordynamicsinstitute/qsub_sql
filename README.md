# README #

Running a SQL server in a qsub process

## Structure ##

* server/
     * initializes and runs PostGreSQL server
     * user-level server - needs to be run by all users
* queries/
     * this is where your queries should go



## How to run ##

* If starting from scratch, go to $Programs/server
     * qsub 00_init_server.qsub
* Then, or if server is already set up:
     * qsub 01_start_server.qsub
* Go to $Programs/queries
     * qsub 00_queries-test.qsub 
