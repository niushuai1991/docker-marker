#!/bin/bash


# PYPI url
if [ -n "$POETRY_PYPI_URL" ]; then
    echo "配置 Poetry 使用镜像源: $POETRY_PYPI_URL"
    poetry config repositories.pypi "$POETRY_PYPI_URL"
else
    echo "未设置 POETRY_PYPI_URL，使用默认 PyPI 源"
fi

poetry install --project=/opt/marker
if [ $? -ne 0 ]; then
    echo "Error: 'poetry install' failed."
    exit 1
fi
#rm -rf /root/.cache/pypoetry/
nohup /opt/monitor_marker.sh > /var/log/monitor_marker.log 2>&1 &
exec python /opt/marker/marker_server.py --host 0.0.0.0 --port 80

