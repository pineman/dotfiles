#!/usr/bin/env python

import sys
import subprocess
import json

def sh(cmd):
    return subprocess.check_output(cmd, shell=True, text=True).rstrip()

def print_line(message):
    """ Non-buffered printing to stdout. """
    sys.stdout.write(message + '\n')
    sys.stdout.flush()

def read_line():
    """ Interrupted respecting reader for stdin. """
    # try reading a line, removing any extra whitespace
    try:
        line = sys.stdin.readline().strip()
        # i3status sends EOF, or an empty line
        if not line:
            sys.exit(3)
        return line
    # exit on ctrl-c
    except KeyboardInterrupt:
        sys.exit()

# Skip the first line which contains the version header.
print_line(read_line())

# The second line contains the start of the infinite array.
print_line(read_line())

while True:
    line, prefix = read_line(), ''
    # ignore comma at start of lines
    if line.startswith(','):
        line, prefix = line[1:], ','

    j = json.loads(line)
    # insert information into the start of the json, but could be anywhere
    # CHANGE THIS LINE TO INSERT SOMETHING ELSE
    bright = "" + sh("brightnessctl i | grep -oP '\d+%'")
    uptime = sh("uptime -p")
    j.insert(0, {'full_text' : bright})
    j.insert(0, {'full_text' : uptime})
    # and echo back new encoded json
    print_line(prefix+json.dumps(j))

