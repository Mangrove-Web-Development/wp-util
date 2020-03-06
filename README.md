# WP Util
Utilities for managing a Docker-based local WordPress development environment.

This is designed to be used with Docker Compose alongside WordPress and database containers.

## Initialize WordPress
To initialize a WordPress install for http://localhost with test credentials:
```sh
wp-init
```

http://localhost

Admin  
username: test  
password: test

## Initialize Multisite
If you want a Multisite install, use:
```sh
multisite-init
```

http://multisite.local

Network admin  
username: test  
password: test

You will need to add entries for multisite.local and each of your subdomains to your hosts file for this to work:
```
127.0.0.1 multisite.local yoursubdomain.multisite.local anothersubdomain.multisite.local
```


### SFTP Credentials
For SFTP utilities, a `sftp-config` file must be mounted at root with format:

```
HOSTNAME=
USERNAME=
PASSWORD='password'
PORT=
```
## For Backups
### Set Varibales
```shell
CONTAINERNAME=wputil
BACKUPS= # backups volume
WP= # wordpress install volume
NETWORK= # wordpress container network
```
To specify directories relative to your current working directory,
you can use:
```shell
`pwd`/rest/of/path
```

### Start Container
```shell
docker run -it --rm \
--name $CONTAINERNAME \
-v "$BACKUPS:/backups" \
-v "$WP:/var/www/html" \
--network=$NETWORK \
rubidot/wputil
```

## Detach
`CTRL+p` `CTRL+q`

## Re-attach
```shell
docker attach $CONTAINERNAME
```

## Exit
`exit`
