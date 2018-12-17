# On a Ctrl-Backspace, we want to emulate Alt-Backspace, which is almost
# always ESC DEL ("\x1b\x7f").

from terminatorlib.terminal import Terminal

# This file doesn't actually define a plugin, but putting it here lets it
# monkey patch on startup.
available = AVAILABLE = []

def key_kill_word(self):
    self.vte.feed_child('\x1b\x7f')

setattr(Terminal, 'key_kill_word', key_kill_word)
