# WP Util
Utilities for managing a Docker-based local WordPress development environment.
This is a publically available Docker image [hosted on the Docker Hub].

This is part of the Mangrove local development setup.
See the documentation for this image in the [Mangrove DevDocs].

## Download Commands
The download commands assume the remote server is a WPEngine environment.
These will work with any SFTP server providing an identical file structure.
These require the [SFTP Config](#sftp-credentials) text file to be created
before the util container is started.

- `download-plugins`
    - This will ___sync___ your local wp-content/plugins folder with the remote
    plugins directory. Any local files that are not on the remote host will be
    deleted.
- `download-uploads`
    - This will ___sync___ your local wp-content/uploads folder with the remote
    directory. Any local files that are not on the remote host will be deleted.
- `download-db`
    - downloads the database SQL file to `wordpress.sql`

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
