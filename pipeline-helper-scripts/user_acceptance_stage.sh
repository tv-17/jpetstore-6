#!/bin/bash
scl enable python27 bash
python test/user_acceptance_tests.py
kill $(lsof -t -i:8080)