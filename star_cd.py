#
# Copyright (c) 2017 LexisNexis Risk Data Management Inc.
#
# This file is part of the RadSSH software package.
#
# RadSSH is free software, released under the Revised BSD License.
# You are permitted to use, modify, and redsitribute this software
# according to the Revised BSD License, a copy of which should be
# included with the distribution as file LICENSE.txt
#
import os

curr_dir = ''

# Keep path elements as list
add_paths = []

def init(**kwargs):
    # Pull the defined dirs from the config setting
    add_paths.extend(kwargs['defaults'].get('plugins.setpath.dirs').split(':'))

def star_cd(cluster, logdir, cmd, *args):
    '''global chdir (prepends to all cmds)'''
    global curr_dir
    if not args:
        curr_dir = ''
        return
    if os.path.isabs(args[0]) or args[0].startswith('~'):
        curr_dir = args[0]
        return
    curr_dir = os.path.join(curr_dir, args[0])

star_commands = {'*cd': star_cd}

def command_listener(cmd):
    if (curr_dir and cmd and cmd[0] != '*'):
        if (add_paths):
            return 'cd %s ; PATH=${PATH}:%s ; %s' % (curr_dir, ':'.join(add_paths), cmd)
        return 'cd %s ; %s' % (curr_dir, cmd)
    if (add_paths and cmd and cmd[0] != '*'):
        return 'PATH=${PATH}:%s; %s' % (':'.join(add_paths), cmd)

