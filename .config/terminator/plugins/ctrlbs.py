# On a Ctrl-Backspace, we want to emulate Alt-Backspace, which is almost
# always ESC DEL ("\x1b\x7f").

from terminatorlib.terminal import Terminal

# This file doesn't actually define a plugin, but putting it here lets it
# monkey patch on startup.
available = AVAILABLE = []

def key_esc_delete(self):
    self.vte.feed_child('\x1b\x7f')

def key_esc_one(self):
    self.vte.feed_child('\x1b\x31')

def key_esc_two(self):
    self.vte.feed_child('\x1b\x32')

def key_esc_thr(self):
    self.vte.feed_child('\x1b\x33')

def key_esc_four(self):
    self.vte.feed_child('\x1b\x34')

def key_esc_five(self):
    self.vte.feed_child('\x1b\x35')

def key_esc_six(self):
    self.vte.feed_child('\x1b\x36')

setattr(Terminal, 'key_esc_delete', key_esc_delete)
setattr(Terminal, 'key_esc_one', key_esc_one)
setattr(Terminal, 'key_esc_two', key_esc_two)
setattr(Terminal, 'key_esc_thr', key_esc_thr)
setattr(Terminal, 'key_esc_four', key_esc_four)
setattr(Terminal, 'key_esc_five', key_esc_five)
setattr(Terminal, 'key_esc_six', key_esc_six)

