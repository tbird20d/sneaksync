#!/bin/sh

./dropsync -c ../sda-timdesk-receiver.conf -r -v -l sda-tim-home-work-receiver.log
sleep 10
./dropsync -c ../sda-timdesk-receiver.conf -r -v -l sda-tim-home-work-receiver.log -i
