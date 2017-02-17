#/bin/bash
if [ -f "/var/www/html/config.php" ];
then
  echo "Factura Scripts ya instalado"
else
  wget https://github.com/NeoRazorX/facturascripts_2015/archive/master.zip
  unzip master.zip -d /tmp
  cp -r /tmp/facturascripts_2015-master/* /var/www/html/
  rm master.zip
  rm -rf /tmp/facturascripts_2015-master
fi

chmod -R o+w /var/www/html
docker-php-entrypoint apache2-foreground
