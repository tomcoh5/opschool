#!/bin/bash
sed -i '/deny/allow/g' /etc/apache2/sites-enabled/000-default.conf
service apache2 restart 
