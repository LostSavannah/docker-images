# Common-rabbit

Simple rabbitmq base image. You can customize the initial user credentials by setting the following environment variables:

|Environment variable|Description|Default value|
|---|---|---|
|RABBITMQ_USER|The admin user name|sa|
|RABBITMQ_PASSWORD|The admin user password|12345678|

You can find this image dockerfile and dependencies [here](https://github.com/LostSavannah/docker-images/tree/main/dockerfile-rabbit)