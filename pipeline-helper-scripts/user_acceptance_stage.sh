#!/bin/bash
scl enable python27 bash
python test/user_acceptance_tests.py
PROCESS_PID=$(cat save_pid.txt)
kill $(lsof -t -i:8080)
kill -9 $PROCESS_PID