
if [ -x $HOME/.mouse_buttons ] ; then
  $HOME/.mouse_buttons
fi

# This is done in .config/autostart/<prog>.desktop now
#
#if [ -z "$SSH_CLIENT" ] && [ -z "$SSH_TTY" ] ; then
#  nohup parcellite -n > /dev/null 2>&1 &
#  nohup redshift > /dev/null 2>&1 &
#fi

# bump stacksize 
# ulimit -s unlimited

# start rdm (this is done in vim now)
# rdm --log-file /tmp/rdm.log --daemon

# then run ...
# cd ~/lnrs/wip/HPCC-Platform
# rc -J ../build/compile_commands.json --silent

# add this to /etc/sysctl.conf
# for rdm/rc
# fs.inotify.max_user_watches=1048576
