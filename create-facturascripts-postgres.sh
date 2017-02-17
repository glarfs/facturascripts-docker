#!/bin/bash
if [ -z "$1" ]
  then
    echo "Error: No se ha especificado un directorio home para facturascripts como parámetro"
    exit
fi
docker run -d -p 5432:5432 --name postgres postgres:latest
docker run -d -p 80:80 --link postgres:db -v $1:/facturascripts-home --name my-facturascripts facturascripts:latest
