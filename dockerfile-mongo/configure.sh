rm ./configure.sh
(sleep 2 && mongosh admin --eval 'db.createUser({user: "'$MONGODB_USER'",pwd: "'$MONGODB_PASSWORD'",roles: [ { role: "userAdminAnyDatabase", db: "admin"}]})')&