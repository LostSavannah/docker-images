type ./configure.sh && ./configure.sh > /dev/null 
mongod --bind_ip 0.0.0.0 --dbpath /data/mongodb --logpath /data/mongodb/log/log.txt