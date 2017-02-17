#!/bin/bash
if [ -z "$1" ]
  then
    echo "Error: No se ha indicado una contraseña de root para Mysql como parámetro"
    exit
fi
if [ -z "$2" ]
  then
    echo "Error: No se ha especificado un directorio home para facturascripts como parámetro"
    exit
fi
docker run --name mysql -e MYSQL_ROOT_PASSWORD=$1 -d mysql
docker run -d -p 80:80 --link mysql:db -v $2:/facturascripts-home --name my-facturascripts facturascripts:latest
