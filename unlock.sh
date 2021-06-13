#!/bin/bash

pidfile=/dev/shm/unlock-${USER}.pid     # lock file path

cleanup() {                   # when cleaning up:
    rm -f $pidfile            # * remove the lock file
    trap - INT TERM EXIT      # * reset kernel signal catching
    exit                      # * stop the daemon
}

log() {                       # simple logging format example
    echo $(date +%Y-%m-%d\ %X) -- $USER -- "$@"
}

function .dbus-session-pid() {
  # get all procs by this user which are running dbus-daemon that have --session in the flags
  ps aux | awk -v u=$USER -v b=/usr/bin/dbus-daemon '$1 == u && $11 == b {print $0;}' | \
    grep -P '\s+--session\b' | awk '{print $2;}'
}

function .dbus-pid-to-display() {
  local dbus_session_pid=$1
  grep -z DISPLAY /proc/$dbus_session_pid/environ | awk -F = '{print $2;}'
}

if [ -e "$pidfile" ]; then    # if lock file exists, exit
    #log $0 already running...
    exit
fi

trap cleanup INT TERM EXIT    # call cleanup() if e.g. killed

#log daemon started...

echo $$ > $pidfile            # create lock file with own PID inside

dbus_pid="$(.dbus-session-pid)"

dbus_sess_bus_addr=$(grep -z DBUS_SESSION_BUS_ADDRESS /proc/${dbus_pid}/environ)

# usually `dbus-daemon` address can be guessed (`-s` returns 1st PID found)
#export $(grep -z DBUS_SESSION_BUS_ADDRESS /proc/$(pidof -s dbus-daemon)/environ)

expr='type=signal,interface=org.gnome.ScreenSaver' # DBus watch expression here

dbus-monitor --address ${DBUS_SESSION_BUS_ADDRESS} "$expr" | \
    while read line; do
        case "$line" in
            *"boolean false"*)
                $HOME/bin/xmodmap.fix;;
        esac
    done

cleanup # let's not leave orphaned lock file when the loop ends (e.g. dbus dies)

