#!/bin/bash

# checkout changes to release branch
git --work-tree=/opt/build --git-dir=/srv/git/site.git checkout -f release

# build the solution with maven and ensure it passes all the tests. If it fails, abort
cd /opt/build
mvn clean install
if [[ "$?" -ne 0 ]]; then
  echo "build failed, stopping deployment"
  exit 1
fi

rm -r /opt/site-node1/*
cp -r /opt/build/target /opt/site-node1/
echo "restarting the first service"
systemctl start site-node1.service
systemctl enable site-node1.service

START_TIME="$(date +%s)"

while [[ `curl -s -o /dev/null -w "%{http_code}" localhost:9000` -ne 200 ]]; do
  sleep 2s
  if [[ `expr $(date +%s) - $START_TIME` -ge 60 ]]; then
    echo "timed out--something is wrong. Aborting..."
    exit 1
  fi
done

echo "first service up, restarting second service"
# stop the second service
systemctl stop site-node2.service
# copy the target directory from the build into the second node directory
rm -r /opt/site-node2/*
cp -r /opt/build/target /opt/site-node2/
# restart the second service
systemctl start site-node2.service
systemctl enable site-node2.service