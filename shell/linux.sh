function regen_icon_cache() {
	# sudo update-icon-caches /usr/share/icons/*
	find /usr/share/icons -mindepth 1 -maxdepth 1 -type d | while read -r THEME; do
	  if [ -f "$THEME/index.theme" ]; then
	    sudo gtk-update-icon-cache -f -q "$THEME"
	  fi
	done
}

function startsrv() {
    if [ -z "$1" ]; then
        echo "Usage: sudo $0 [web server service]";
        return;
    fi

    if [[ "$1" == 'mongo' ]]; then
    	sudo /etc/init.d/mongodb start;
    	echo "MongoDB started.";
    	return;
    fi

    if [[ "$1" == 'php' ]]; then
    	sudo /etc/init.d/php7.2-fpm start;
    	echo "PHP-FPM started.";
    	return;
    fi

    if [[ "$1" == 'mysql' ]]; then
        sudo /etc/init.d/mysql start;
        echo "MySQL started.";
        return;
    fi

    if [[ "$1" == 'nginx' ]]; then
    	sudo /etc/init.d/nginx start;
    	echo "Nginx started.";
    	return;
    fi

    if [[ "$1" == 'postgres' ]]; then
    	sudo /etc/init.d/postgresql start;
    	echo "PostgreSQL started.";
    	return;
    fi

    if [[ "$1" == 'redis' ]]; then
        sudo /etc/init.d/redis-server start;
        echo "Redis started.";
        return;
    fi

    if [[ "$1" == 'es' ]]; then
        sudo /etc/init.d/elasticsearch start;
        echo "elasticsearch started.";
        return;
    fi

    if [[ "$1" == 'kibana' ]]; then
        sudo /etc/init.d/kibana start;
        echo "kibana started.";
        return;
    fi
    

    if [[ "$1" == 'all' ]]; then
    	startsrv mongo
    	startsrv php
    	startsrv nginx
    	startsrv mysql
    	startsrv postgres
        startsrv redis
    	return;
    fi

    echo "service not found.";
    return;
}