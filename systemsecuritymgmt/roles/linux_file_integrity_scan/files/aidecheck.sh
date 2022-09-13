#!/bin/bash

# file integrity check
/usr/sbin/aide --check > /data/aide/report.txt_$(date +%F_%H_%M_%Z).txt 2>&1