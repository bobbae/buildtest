#!/bin/bash
echo building
cd example
make
docker build -t bobbae/example .
# push will fail if you didn't login before
#docker push bobbae/example

echo hello 1 2 3 4 5
