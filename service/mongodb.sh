#!/bin/sh
#http://stackoverflow.com/questions/15204341/mongodb-logging-all-queries

mkdir -p /job/mongo/data
mkdir -p /job/mongo/log
mongod --dbpath /job/mongo/data --smallfiles --logpath /job/mongo/log/mongodb.log >> /job/mongo/log/start.log 2>&1