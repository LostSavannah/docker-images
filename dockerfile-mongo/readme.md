# Common-mongo

Simple mongodb base image. You can customize the initial user credentials by setting the following environment variables:

|Environment variable|Description|Default value|
|---|---|---|
|MONGODB_USER|The initial user name|sa|
|MONGODB_PASSWORD|The initial user password|12345678|

You can find this image dockerfile and dependencies [here](https://github.com/LostSavannah/docker-images/tree/main/dockerfile-mongo)