#!/bin/sh

# Based on: https://github.com/majgis/psproxy/commit/47b833b06cd8347e51b5d6ffb90ecafa879cd579

PROGNAME=${0##*/}
PS_STATE_BASE='State:/Network/Service/net.pulsesecure.pulse.nc.main'
PS_STATE_IPV4="${PS_STATE_BASE}/IPv4"
PS_STATE_PROXY="${PS_STATE_BASE}/Proxies"

usage() {
  echo "usage: ${PROGNAME}: {on|off}" >&2
  exit 1
}

scutilw() {
  echo "d.init\n${1}" | scutil
}

case "$1" in
  on)
    [ ${VERBOSE}x != x ] && echo 'Enable proxy' >&2
    key=`echo "show ${PS_STATE_IPV4}" | scutil | sed -n '/.*DSUnderlyingServiceName/s/.*: \([0-9A-F-][0-9A-F-]*\)/\1/p'`
    scutilw "get Setup:/Network/Service/${key}/Proxies\nset ${PS_STATE_PROXY}"
    ;;
  off)
    [ ${VERBOSE}x != x ] && echo 'Disable proxy' >&2
    scutilw "get ${PS_STATE_PROXY}\nd.add HTTPSEnable 0\nd.add HTTPEnable 0\nset ${PS_STATE_PROXY}"
    ;;
  *)
    usage
    ;;
esac
