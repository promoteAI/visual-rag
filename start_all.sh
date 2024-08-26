#!/usr/bin/env bash
ray stop
ray start --head
python3 main.py