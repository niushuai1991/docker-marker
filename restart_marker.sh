#!/bin/bash

# 查找 marker_server 的进程并杀死
PID=$(ps -ef | grep 'marker_server' | grep -v 'grep' | awk '{print $2}')
if [ -n "$PID" ]; then
  echo "Found marker_server process with PID $PID. Killing it..."
  sudo kill -9 $PID
else
  echo "No running marker_server process found."
fi

# 启动 marker_server
echo "Starting marker_server..."
nohup  sudo /marker/venv-marker/bin/python3 /marker/venv-marker/bin/marker_server --port 8002 >> /marker/log/marker_server.log 2>&1 &

echo "marker_server restarted successfully."

