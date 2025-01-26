#!/bin/bash

poetry install --no-cache --project=/opt/marker
nohup /opt/monitor_marker.sh > /var/log/monitor_marker.log 2>&1 &
python /opt/marker/marker_server.py --host 0.0.0.0 --port 80