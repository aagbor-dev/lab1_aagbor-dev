#!/bin/bash
# Log analyser for the Kigali road simulation.
# Usage: bash analyze_log.sh [logfile]
# If no file is given it reads transit_session.log.

LOGFILE="${1:-transit_session.log}"

if [ ! -f "$LOGFILE" ]; then
    echo "Error: log file '$LOGFILE' does not exist." >&2
    exit 1
fi

# every run writes one "New session started" line
sessions=$(grep -c "New session started" "$LOGFILE")

# a zebra stop is logged as "Zebra crossing! Stopping for ..."
zebra_stops=$(grep -c "Zebra crossing! Stopping" "$LOGFILE")

# a lane change is logged as "Changing lane: ..."
lane_changes=$(grep -c "Changing lane:" "$LOGFILE")

# latest trip report: take the last Driver line and the last Top speed line
driver=$(grep "Driver  *:" "$LOGFILE" | tail -n 1 | sed 's/.*Driver  *: *//')
top_speed=$(grep "Top speed  *:" "$LOGFILE" | tail -n 1 | sed 's/.*Top speed  *: *//')

echo "===== Log summary: $LOGFILE ====="
echo "Sessions         : $sessions"
echo "Zebra stops      : $zebra_stops"
echo "Lane changes     : $lane_changes"
if [ -z "$driver" ]; then
    echo "Latest driver    : no finished trip in the log yet"
else
    echo "Latest driver    : $driver"
    echo "Top speed        : $top_speed"
fi
