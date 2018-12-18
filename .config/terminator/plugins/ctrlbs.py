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

setattr(Terminal, 'key_esc_delete', key_esc_delete)
setattr(Terminal, 'key_esc_one', key_esc_one)
