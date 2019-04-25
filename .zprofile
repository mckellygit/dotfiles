
if [ -z "$SSH_CLIENT" ] && [ -z "$SSH_TTY" ] ; then
  if [ -x $HOME/.mouse_buttons ] ; then
    $HOME/.mouse_buttons
  fi
fi

# This is done in .config/autostart/<prog>.desktop now
#
#if [ -z "$SSH_CLIENT" ] && [ -z "$SSH_TTY" ] ; then
#  # parcellite can sometimes have trouble starting from autostart
#  # its possible that its about to start also and so this would 
#  # start another ...
#  pgrep parcellite > /dev/null 2>&1
#  rc=$?
#  if [[ $rc -ne 0 ]] ; then
#    setsid parcellite -n </dev/null >/dev/null 2>&1 &
#  fi
## setsid redshift </dev/null >/dev/null 2>&1 &
#fi

# bump stacksize 
ulimit -s unlimited

# if we are xterm then try xterm-256color
if [ -n "$TERM" ] ; then
    if [ "$TERM" = "xterm" ] ; then
        export TERM=xterm-256color
    fi
fi

# start rdm (this is done in vim now)
# rdm --log-file /tmp/rdm.log --daemon
#
# add this to /etc/sysctl.conf
# for rdm/rc
# fs.inotify.max_user_watches=1048576
#
# then run ...
# cd ~/lnrs/wip/HPCC-Platform
# rc -J ../build/compile_commands.json --silent

export ZPROFILE="loaded"

