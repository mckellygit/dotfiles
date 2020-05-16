# On a Ctrl-Backspace, we want to emulate Alt-Backspace, which is almost
# always ESC DEL ("\x1b\x7f").

from terminatorlib.terminal import Terminal

# This file doesn't actually define a plugin, but putting it here lets it
# monkey patch on startup.
available = AVAILABLE = []

# NOTE: all functions and labels defined MUST start with "key_" string
#       and the corresponding mapping in ../config does NOT have "key_"

def key_ctrl_back(self):
    self.vte.feed_child('\x1b\x7f', 2)
def key_shft_back(self):
    self.vte.feed_child('\x7f', 1)
def key_ctrl_shft_back(self):
    self.vte.feed_child('\x1b\x32', 2)

def key_ctrl_equal(self):
    self.vte.feed_child('\x1b\x33', 2)

def key_ctrl_shft_space(self):
    self.vte.feed_child('\x1b\x34', 2)

def key_ctrl_shft_x(self):
    self.vte.feed_child('\x1b\x39', 2)

def key_ctrl_ins(self):
    self.vte.feed_child('\x1b\x5b\x32\x3b\x35\x7e', 6)
def key_shft_ins(self):
    self.vte.feed_child('\x1b\x5b\x32\x3b\x32\x7e', 6)
def key_ctrl_shft_ins(self):
    self.vte.feed_child('\x1b\x5b\x32\x3b\x36\x7e', 6)

def key_ctrl_del(self):
    self.vte.feed_child('\x1b\x5b\x33\x3b\x35\x7e', 6)
def key_shft_del(self):
    self.vte.feed_child('\x1b\x5b\x33\x3b\x32\x7e', 6)
def key_ctrl_shft_del(self):
    self.vte.feed_child('\x1b\x5b\x33\x3b\x36\x7e', 6)

setattr(Terminal, 'key_ctrl_back',       key_ctrl_back)
setattr(Terminal, 'key_shft_back',       key_shft_back)
setattr(Terminal, 'key_ctrl_shft_back',  key_ctrl_shft_back)

setattr(Terminal, 'key_ctrl_equal',      key_ctrl_equal)

setattr(Terminal, 'key_ctrl_shft_space', key_ctrl_shft_space)

setattr(Terminal, 'key_ctrl_shft_x',     key_ctrl_shft_x)

setattr(Terminal, 'key_ctrl_ins',        key_ctrl_ins)
setattr(Terminal, 'key_shft_ins',        key_shft_ins)
setattr(Terminal, 'key_ctrl_shft_ins',   key_ctrl_shft_ins)

setattr(Terminal, 'key_ctrl_del',        key_ctrl_del)
setattr(Terminal, 'key_shft_del',        key_shft_del)
setattr(Terminal, 'key_ctrl_shft_del',   key_ctrl_shft_del)

