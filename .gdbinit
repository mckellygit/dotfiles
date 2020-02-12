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
