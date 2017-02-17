# Imagen de docker para FacturaScripts
Este es un repositorio para la creación automática de una imagen de docker, con el software FacturasScripts instalado y listo para ejecutar

## Instrucciones para su ejecución

En el repositorio se encuentran dos scripts que ayudan a la creación de contenedores basados en esta imagen:

* create-facturascripts-mysql.sh
* create-facturascripts-postgres.sh

Cada uno de ellos, lanzará un contenedor de facturascripts, asociando una base de datos Mysql, o Postgres según el script ejecutado

### Ejecución de contenedor con Mysql

El script para Mysql requiere dos parámetros:

1. Contraseña de root que queramos usar para acceder a la base de datos Mysql
2. Ruta absoluta del directorio local, donde se mapeará el home de los archivos de facturascripts

Un ejemplo de ejecucion del script sería el siguiente:

> *./create-facturascripts-mysql.sh rootpass /home/miusuario/facturascripts-home*

### Ejecución de contenedor con Postgres

El script para Postgres requiere un parámetro:

1. Ruta absoluta del directorio local, donde se mapeará el home de los archivos de facturascripts.

Un ejemplo de ejecucion del script sería el siguiente:

> *./create-facturascripts-postgres.sh /home/miusuario/facturascripts-home*

En este caso, el usuario a usar sería **postgres** y password **postgres**.


Ya sea con el script de Mysql o el de Postgres, cuando se entre en la pantalla inicial de configuración de facturascripts, el nombre del servidor de base de datos deberá ser **db**

## Ejecución desde linea de comandos sin scripts

Para ejecutar el contenedor sin scripts de ayuda, el comando básico que se podria usar es el siguiente:

> *docker run -d -p 80:80 -v /home/miusuario/facturascripts-home:/facturascripts-home --name my-facturascripts facturascripts:latest*

Si se tiene un contenedor de base de datos ejecutandose, puede añadirse el link a ese contenedor para facilitar el acceso. Un ejemplo sería lo siguiente:

> *docker run -d -p 80:80 --link nombre-contenedor-base-de-datos:db -v /home/miusuario/facturascripts-home:/facturascripts-home --name my-facturascripts facturascripts:latest*

En este caso el nombre del servidor de base de datos a usar en la configuración inicial de FacturaScripts debe ser **db**
