------- help -------

prefix = <Ctrl-s>

prefix <Arrow>          - navigate panes
prefix <s>              - move to next window (<C-s>)
prefix <Ctrl-z>         - toggle pane zoom

Alt-Shift-<Arrow>       - resize panes
Drag on window border   - resize panes

Alt-<Left>,<Right>      - navigate windows
Ctrl-Alt-<BS>           - navigate windows
Ctrl-Alt-<=>            - navigate windows
Ctrl-Alt-<Space>        - navigate windows

prefix <Ctrl-r>         - re-load tmux conf file

prefix <z>              - fzf popup of files in cwd
                            <C-\>      - preview file
                            <C-k,j>    - preview up, down
                            <C-b,f>    - preview half-page up, down
                            <BS,Space> - preview page up, down
                            <C-q>      - quit (<C-c>, <Esc>)

prefix <q>              - fzf popup of cmd history

prefix <.>              - copy cmdline to clipboard

prefix <Ctrl-p>         - display pane ids

prefix <K>              - kill pane

prefix <w>              - tmux pane list
prefix <y>              - fzf popup window list
prefix <u>              - fzf popup pane list

Ctrl-Shift-<[>          - cmd history down (<Up>)
Ctrl-Shift-<]>          - cmd history up   (<Down>)
Ctrl-Shift-</>          - clear cmdline    (<C-c>)

prefix <Ctrl-a>         - cmd history   (<Up>)
prefix <Ctrl-x>         - execute cmd   (<CR>)
prefix <Ctrl-e>         - clear cmdline (<Ctrl-u>)

Shift-<F12>             - toggle function keys

In copy-mode:
2-click rt status       - exit copy-mode (also <C-q>)
Ctrl-2-click rt status  - exit copy-mode and paste selection (also Alt)

2-click lt status       - exit copy-mode

In normal-mode:
2-click rt status       - paste selection
Ctrl-2-click rt status  - execute cmdline (also Alt)

2-click lt status       - clear cmdline (<Ctrl-u>)

