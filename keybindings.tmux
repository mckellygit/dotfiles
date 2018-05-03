unbind-key -n C-a
unbind-key -n C-s
set -g prefix ^S
set -g prefix2 ^Q
bind s send-prefix
bind-key -T prefix k confirm-before -p "kill-pane #P? (y/n)" kill-pane
