#!/usr/bin/env bash

set -euo pipefail

cd "$(dirname "$0")"
mkdir -p logs

if [[ -x ../.venv/bin/python ]]; then
	PYTHON_BIN="../.venv/bin/python"
elif command -v python3 >/dev/null 2>&1; then
	PYTHON_BIN="$(command -v python3)"
else
	echo "Python 3 was not found. Set PYTHON_BIN or create ../.venv/bin/python." >&2
	exit 1
fi

"$PYTHON_BIN" disk.py -a 0 -c > logs/basic-a0.txt
"$PYTHON_BIN" disk.py -a 6 -c > logs/basic-a6.txt
"$PYTHON_BIN" disk.py -a 30 -c > logs/basic-a30.txt
"$PYTHON_BIN" disk.py -a 7,30,8 -c > logs/basic-a7-30-8.txt
"$PYTHON_BIN" disk.py -a 10,11,12,13 -c > logs/basic-a10-11-12-13.txt

"$PYTHON_BIN" disk.py -a 7,30,8 -S 2 -c > logs/seek-s2.txt
"$PYTHON_BIN" disk.py -a 7,30,8 -S 8 -c > logs/seek-s8.txt
"$PYTHON_BIN" disk.py -a 7,30,8 -S 40 -c > logs/seek-s40.txt
"$PYTHON_BIN" disk.py -a 7,30,8 -S 0.1 -c > logs/seek-s0.1.txt

"$PYTHON_BIN" disk.py -a 7,30,8 -R 0.1 -c > logs/rotation-r0.1.txt
"$PYTHON_BIN" disk.py -a 7,30,8 -R 0.5 -c > logs/rotation-r0.5.txt
"$PYTHON_BIN" disk.py -a 7,30,8 -R 0.01 -c > logs/rotation-r0.01.txt

"$PYTHON_BIN" disk.py -a 7,30,8 -p FIFO -c > logs/policy-fifo.txt
"$PYTHON_BIN" disk.py -a 7,30,8 -p SSTF -c > logs/policy-sstf.txt
"$PYTHON_BIN" disk.py -a 7,30,8 -p SATF -c > logs/policy-satf.txt

echo "All Lab 3 logs generated in ./logs"