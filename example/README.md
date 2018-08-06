# example 

To build:

```
$ go build
```

To create docker image:

```
$ docker build -t xyz/example .
```

replace `xyz` with your docker hub name.

To push to docker hub:

```
$ docker push xyz/example
```

The example was created by running `boilr`:

```
go get github.com/tmrts/boilr
boilr template download loderunner/boilr-grpc grpc
boilr template use grpc project-name
```

