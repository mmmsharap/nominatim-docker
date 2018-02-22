service postgresql start

sudo -u postgres psql postgres -tAc "SELECT 1 FROM pg_roles WHERE rolname='nominatim'" | grep -q 1 || sudo -u postgres createuser -s nominatim

sudo -u postgres psql postgres -tAc "SELECT 1 FROM pg_roles WHERE rolname='www-data'" | grep -q 1 || sudo -u postgres createuser -SDR www-data

sudo -u postgres psql postgres -c "DROP DATABASE IF EXISTS nominatim"

sudo -u nominatim ./src/build/utils/setup.php --osm-file /app/src/data.osm.pbf --all --threads 2

service postgresql stop
