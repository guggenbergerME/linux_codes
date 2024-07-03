#!/bin/bash
# Backup eines Ordners


tar -zcf /home/bpc009/packen/name-`date +%Y-%m-%d_%H:%M:%S`.tgz /home/bpc009/text | rclone sync -Pv /home/bpc009/packen/ ftp:tar/
