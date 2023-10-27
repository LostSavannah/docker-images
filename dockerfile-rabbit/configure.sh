update-rc.d rabbitmq-server defaults
echo "NODENAME=rabbit@localhost" > /etc/rabbitmq/rabbitmq-env.conf
service rabbitmq-server start
rabbitmq-plugins enable rabbitmq_management
rabbitmqctl add_user $RABBITMQ_USER $RABBITMQ_PASSWORD > /dev/null
rabbitmqctl set_user_tags $RABBITMQ_USER administrator
rabbitmqctl set_permissions -p / $RABBITMQ_USER ".*" ".*" ".*"
service rabbitmq-server stop
rm ./configure.sh