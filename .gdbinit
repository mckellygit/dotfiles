set pagination off
set auto-load safe-path /
set history filename ~/.gdb_history
set history size 50
set history remove-duplicates 1000
set history save on
source ~/.cgdb/ShellPipeCommand.py
set confirm off
set print object on
set backtrace limit 30
define btall
  set pagination off
  thread apply all bt
  dont-repeat
end
define btfull
  set pagination off
  thread apply all bt full
  dont-repeat
end
handle SIGINT stop
dir .
dir ~/lnrs/wip/build/generated
dir ~/lnrs/wip/HPCC-Platform
dir ~/lnrs/wip/LN
tui disable
#source ~/Downloads/gdb-dashboard/.gdbinit
source ~/Downloads/gef/gef.py
