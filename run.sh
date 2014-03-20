#!/bin/bash
cd src/
python -m SimpleHTTPServer 8001 &
PID=$!

trap "kill 0" SIGINT SIGTERM EXIT
sleep 2

cd app/dashboards/
for dashboard in $(ls *.json | grep -v -e default -e empty ); do
  open http://localhost:8001/#/dashboard/file/${dashboard}
done

wait $PID
