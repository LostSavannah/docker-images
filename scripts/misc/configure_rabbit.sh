service rabbitmq-server start
rabbitmqctl add_user root 12345678
rabbitmqctl set_user_tags root administrator
rabbitmqctl set_permissions -p / root ".*" ".*" ".*"
rabbitmq-plugins enable rabbitmq_management
service rabbitmq-server stop