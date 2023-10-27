apt-get update
apt-get install -y wget gnupg curl

curl -1sLf "https://keys.openpgp.org/vks/v1/by-fingerprint/0A9AF2115F4687BD29803A206B73A36E6026DFCA" | gpg --dearmor | tee /usr/share/keyrings/com.rabbitmq.team.gpg > /dev/null
curl -1sLf https://github.com/rabbitmq/signing-keys/releases/download/3.0/cloudsmith.rabbitmq-erlang.E495BB49CC4BBE5B.key | gpg --dearmor | tee /usr/share/keyrings/rabbitmq.E495BB49CC4BBE5B.gpg > /dev/null
curl -1sLf https://github.com/rabbitmq/signing-keys/releases/download/3.0/cloudsmith.rabbitmq-server.9F4587F226208342.key | gpg --dearmor | tee /usr/share/keyrings/rabbitmq.9F4587F226208342.gpg > /dev/null

echo 'deb [signed-by=/usr/share/keyrings/rabbitmq.E495BB49CC4BBE5B.gpg] https://ppa1.novemberain.com/rabbitmq/rabbitmq-erlang/deb/ubuntu jammy main' > /etc/apt/sources.list.d/rabbitmq.list
echo 'deb-src [signed-by=/usr/share/keyrings/rabbitmq.E495BB49CC4BBE5B.gpg] https://ppa1.novemberain.com/rabbitmq/rabbitmq-erlang/deb/ubuntu jammy main' >> /etc/apt/sources.list.d/rabbitmq.list
echo 'deb [signed-by=/usr/share/keyrings/rabbitmq.9F4587F226208342.gpg] https://ppa1.novemberain.com/rabbitmq/rabbitmq-server/deb/ubuntu jammy main' >> /etc/apt/sources.list.d/rabbitmq.list
echo 'deb-src [signed-by=/usr/share/keyrings/rabbitmq.9F4587F226208342.gpg] https://ppa1.novemberain.com/rabbitmq/rabbitmq-server/deb/ubuntu jammy main' >> /etc/apt/sources.list.d/rabbitmq.list

apt-get install rabbitmq-server -y --fix-missing

mkdir -p /data/mongodb/db /data/mongodb/log

update-rc.d rabbitmq-server defaults
echo "NODENAME=rabbit@localhost" > /etc/rabbitmq/rabbitmq-env.conf
service rabbitmq-server start
rabbitmq-plugins enable rabbitmq_management
rabbitmqctl add_vhost vhost
rabbitmqctl add_user sa 12345678
rabbitmqctl set_user_tags sa administrator
rabbitmqctl set_permissions -p vhost sa ".*" ".*" ".*"
service rabbitmq-server stop