#!/bin/bash
#set -x
#ssh-copy-id user_ahmadbon@192.168.100.11
#ssh user_ahmadbon@192.168.100.11

sudo scp -r src/cat/s21_cat user_ahmadbon@192.168.100.11:/usr/local/bin
sudo scp -r src/grep/s21_grep user_ahmadbon@192.168.100.11:/usr/local/bin