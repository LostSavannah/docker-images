update-rc.d rabbitmq-server defaults
echo "NODENAME=rabbit@localhost" > /etc/rabbitmq/rabbitmq-env.conf
service rabbitmq-server start
rabbitmq-plugins enable rabbitmq_management
rabbitmqctl add_user sa 12345678
rabbitmqctl set_user_tags sa administrator
rabbitmqctl set_permissions -p / sa ".*" ".*" ".*"
service rabbitmq-server stop