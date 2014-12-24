docker-devdocs
==============

[DevDocs][1] combines multiple API documentations in a fast, organized, and searchable interface. 
This build contains all available docs. It's based on [catchy.io][2] build.

Usage
-----

Start (it will fetch the docker image if it's not downloaded):
```shell
docker run --rm -p 9292:9292 --name devdocs lejenome/devdocs
```

Stop:
```shell
docker stop devdocs
```

Uninstall:
```shell
docker rmi lejenome/devdocs
```

Docker image creation
---------------------
It's based on a Makefile, so you'll need the make command.
```
make
```

[1]: http://devdocs.io/ "DevDocs"
[2]: http://catchy.io "catchy.io"
