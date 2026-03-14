# Lab 3 — Disk Scheduling Simulation

OSTEP disk simulator (`disk.py`) exploring seek time, rotational delay, transfer time, and scheduling policies (FIFO, SSTF, SATF).

## Prerequisites

- Python 3 (Tkinter optional — only needed for the `-G` graphical mode)

## Quick Start

```bash
# Run a single request
python3 disk.py -a 10 -c

# Run with graphical mode (requires Tkinter)
python3 disk.py -a 10 -G
```

## Reproduce All Lab Logs

```bash
chmod +x run_all.sh
./run_all.sh
```

This generates all output files in `logs/`.

## Key Flags

| Flag        | Description                                     | Default |
| ----------- | ----------------------------------------------- | ------- |
| `-a ADDR`   | Comma-separated sector requests (e.g. `7,30,8`) | random  |
| `-c`        | Compute and show answers                        | off     |
| `-G`        | Graphical animation (needs Tkinter)             | off     |
| `-p POLICY` | Scheduling policy: `FIFO`, `SSTF`, `SATF`       | `FIFO`  |
| `-S SPEED`  | Seek speed (distance units / time unit)         | `1`     |
| `-R SPEED`  | Rotation speed (degrees / time unit)            | `1`     |
| `-s SEED`   | Random seed                                     | `0`     |

For the full flag reference see [OSTEP-file-disks-README.md](OSTEP-file-disks-README.md).

## Log Files

| File              | What it tests                        |
| ----------------- | ------------------------------------ |
| `basic-a*.txt`    | Single and multi-sector access times |
| `seek-s*.txt`     | Effect of varying seek speed         |
| `rotation-r*.txt` | Effect of varying rotation speed     |
| `policy-*.txt`    | FIFO vs SSTF vs SATF scheduling      |
