# Docker mStream

This is a really basic docker image for [mStream](https://github.com/IrosTheBeggar/mStream)

## Usage

```
docker run -d -p 80:80 -v /path/to/music/folder:/music -e USER=admin -e PASSWORD=secure-password hzrd149/mstream
```

## Parameters
 - `-p 80:80` Forwards port 80 from the host to the container
 - `-v /path/to/music/folder:/music` The path to your music folder
 - `-e KEY="value"` These are environment variables which configure the container. See below for a description of their meanings.

## Environment variables
 - `USER` Sets the username for the login (see [docs](https://github.com/IrosTheBeggar/mStream/blob/master/docs/cli_arguments.md#user-system))
 - `PASSWORD` Sets the password for the user (see [docs](https://github.com/IrosTheBeggar/mStream/blob/master/docs/cli_arguments.md#user-system))
 - `PORT` Sets the internal port the server is hosted on
 - `NO_UPLOAD` Sets the `--noupload` option (see [docs](https://github.com/IrosTheBeggar/mStream/blob/master/docs/cli_arguments.md#diable-upload))

## Docker compose

Basic Example with no login and no uploads
```yaml
version: "3"

services:
  mstream:
    image: hzrd149/mstream
    ports:
      - 8080:80
    volumes:
      - ./music:/music
    environment:
      NO_UPLOAD: "true"
```

Example with login
```yaml
version: "3"

services:
  mstream:
    image: hzrd149/mstream
    ports:
      - 8080:80
    volumes:
      - ./music:/music
    environment:
      USER: "admin"
      PASSWORD: "secure-password"
```
