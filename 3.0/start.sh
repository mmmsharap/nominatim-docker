#!/bin/bash
service postgresql start
(while true ; do sleep 5 ; sudo -u nominatim /app/src/build/utils/update.php --import-osmosis-all ; done)&
/usr/sbin/apache2ctl -D FOREGROUND
