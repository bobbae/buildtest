#!/bin/bash
echo building
cd example
make
docker build -t bobbae/example .
docker push bobbae/example

echo hello 1 2 3
