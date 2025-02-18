#!/bin/bash

poetry install --project=/opt/marker
rm -rf /root/.cache/pypoetry/
nohup /opt/monitor_marker.sh > /var/log/monitor_marker.log 2>&1 &
python /opt/marker/marker_server.py --host 0.0.0.0 --port 80