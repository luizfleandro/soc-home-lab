#!/bin/bash
# Start, stop or check the status of the SOC Home Lab.
# Usage: ./lab.sh start | stop | status

COMPOSE_DIR="$HOME/soc-home-lab/configs"
SPLUNK="/opt/splunk/bin/splunk"

case "$1" in
  start)
    (cd "$COMPOSE_DIR" && docker compose start)
    sudo -H -u splunk "$SPLUNK" start
    echo "Lab started. Splunk: http://127.0.0.1:8000"
    ;;
  stop)
    (cd "$COMPOSE_DIR" && docker compose stop)
    sudo -H -u splunk "$SPLUNK" stop
    echo "Lab stopped."
    ;;
  status)
    docker ps --format "table {{.Names}}\t{{.Status}}"
    sudo -H -u splunk "$SPLUNK" status
    ;;
  *)
    echo "Usage: $0 start | stop | status"
    exit 1
    ;;
esac
