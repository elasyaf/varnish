varnishd -a :80 -f /etc/varnish/default.vcl -s malloc,256m
while true; do sleep 1000; done