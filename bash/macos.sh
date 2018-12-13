function clear_dns() {
	echo "Killing mDNSResponder....";
	sudo killall -HUP mDNSResponder;
	echo "Killing mDNSResponderHelper....";
	sudo killall mDNSResponderHelper;
	echo "Flushing cache....";
	sudo dscacheutil -flushcache
}
