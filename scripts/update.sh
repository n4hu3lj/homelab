#!/bin/bash

echo "<4ctu4liz4ci0n d3 syst3m 3mp3c4d4> $(date)"

apt update && \
apt upgrade -y && \
apt autoremove -y && \
apt autoclean

echo "4ctu4liz4ci0n t3rm1n4d4"