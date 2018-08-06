#!/bin/bash
echo building
cd example
make
docker build -t bobbae/example .
docker push bobbae/example


