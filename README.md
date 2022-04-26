# WP Util
Utilities for managing a Docker-based local WordPress development environment.
This is a publically available Docker image [hosted on the Docker Hub].

This is part of the Mangrove local development setup.
See the documentation for this image in the [Mangrove DevDocs].

## Download Commands
These require the [SFTP Config](#sftp-credentials) text file to be created
before the util container is started.

### Download Directory Commands
These commands ___sync___ you local folder with the remote directory.
Any local files that are not on the remote host will be deleted.

- `download-directory REMOTE_PATH [LOCAL_PATH]`
    - You probably don't need to use this command directly.
    - Path arguments prepend their respective optional prefixes defined in sftp-config.
    - `LOCAL_PATH` defaults to `REMOTE_PATH` if not specified.
- `download-plugins`
    - This will sync your local _wp-content/plugins_ folder with the remote
    plugins directory.
- `download-uploads`
    - This will sync your local _wp-content/uploads_ folder with the remote
    directory.

### Download Database
- `download-db`
    - Downloads the database SQL file to `wordpress.sql`
    - Assumes the database file is at `/wp-content/mysql.sql` on the remote
      server. This is where WPEngine stores the latest database backup.

## Other Commands
These work whether or not an SFTP config file is created.
- `wp`
    - See [wp-cli.org](http://wp-cli.org/) for details.
- `import-db` or `multisite-import-db`
    - Imports the `wordpress.sql` file at the root of the local project directory.
    - Make sure to use the appropriate command for a single vs multisite install.
- `wp-init` or `multisite-init`
    - Initializes as a single or mult-site WP install with default values
      so you can skip the in-browser setup screens.

## SFTP-Credentials
Create a plain text file at `docker-compose/sftp-config` with no file extension.
If there is a folder at that path, shut down any running Docker services and
delete that folder.

Enter your SFTP credentials in this format:
```sh
HOSTNAME=
USERNAME=
PASSWORD=''
PORT=2222
REMOTE_PREFIX='' # Optional: path to WordPress directory on remote server.
LOCAL_PREFIX=''  # Optional: path to local WP directory. Defaults to /var/www/html.
```
Note: place password in `'single quotes'` to avoid issues with special characters.

This is technically a shell script, so you can use shell syntax to enter
multiple sets of credentials toggled via variable:
```sh
ENV=DEV

if [ $ENV = PROD ]; then
  HOSTNAME=
  USERNAME=
  PASSWORD=''
elif [ $ENV = STAGE ]; then
  HOSTNAME=
  USERNAME=
  PASSWORD=''
elif [ $ENV = DEV ]; then
  HOSTNAME=
  USERNAME=
  PASSWORD=''
fi
PORT=2222
```
## Docker Build

### Platform
This image should be built only using `linux/amd64` platform.
On Apple Silicon, this is done using the `--platform=linux/amd64` option.

### Tags
Each build should be tagged with its version number using the SemVer format.
`--tag mangroveweb/wp-local:version`

### Example
`--push` pushes the completed build to the Docker Hub.

`.` is the path argument, instructing Docker to use the current working directory as the build context.
```sh
docker buildx build --push --platform=linux/amd64 --tag=mangroveweb/wp-util:2.0.0 .
```

[Mangrove DevDocs]: https://www.notion.so/mangroveweb/Utilities-0dfb5033f8694cf8bca00d056c01a0ae
[hosted on the Docker Hub]: https://hub.docker.com/r/mangroveweb/wp-util
