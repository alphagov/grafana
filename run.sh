#!/bin/bash
cd src/
python -m SimpleHTTPServer &
PID=$!

trap "kill 0" SIGINT SIGTERM EXIT
sleep 2

cd app/dashboards/
for i in $(ls -1 *.json | grep -v default); do
  open http://localhost:8000/#/dashboard/file/${i}
done

wait $PID
