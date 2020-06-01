# ps-proxy

Simple shell script to enable/disable HTTP{,S} proxy on Pulse Secure VPN.

Thanks to [robfromca's script](https://github.com/robfromca/random-scripts/blob/master/vpn-charles.rb), [mivasi's gist](https://gist.github.com/mivasi/bc0046aa2277a64726c8) and [majgis's psproxy](https://github.com/majgis/psproxy), we can get the way to toggle HTTP/HTTPS proxy settings on Pulse Secure VPN.

This script just simplified majgis's `psproxy.sh` to be handy for using it as plain shell script.

Note: To enable HTTP{,S} Proxy, you need to set up them on base network.
