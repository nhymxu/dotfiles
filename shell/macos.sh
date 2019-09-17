function clear_dns() {
	echo "Killing mDNSResponder....";
	sudo killall -HUP mDNSResponder;
	echo "Killing mDNSResponderHelper....";
	sudo killall mDNSResponderHelper;
	echo "Flushing cache....";
	sudo dscacheutil -flushcache
}

alias pyenvi='CFLAGS="-I$(xcrun --show-sdk-path)/usr/include" pyenv install'
