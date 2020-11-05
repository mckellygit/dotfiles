------- help -------

prefix = Ctrl-<s>

prefix <arrow>          - navigate panes
prefix <s>              - move to next pane (prefix Ctrl-<s> prev pane)
prefix <z>              - toggle pane zoom (prefix Ctrl-<z>)
Alt-<Up>,<Down>         - move to next, previous pane

Alt-Shift-<arrow>       - resize panes
Drag on window border   - resize panes

Alt-<Left>,<Right>      - move to next, prev window
Ctrl-Alt-<BS>           - move to next window
Ctrl-Alt-<Space>        - move to prev window (Ctrl-Alt-<=>)

prefix <q>              - re-load tmux conf file (prefix Ctrl-<q>)

prefix Ctrl-<t>         - fzf popup of files in cwd
                            Ctrl-<\>      - toggle file preview
                            Ctrl-<k,j>    - preview up, down
                            Ctrl-<b,f>    - preview half-page up, down
                            Ctrl-<u,d>    - preview page up, down
                            Ctrl-<q>      - quit (Ctrl-<c>, <Esc>)

prefix Ctrl-<r>         - fzf popup of cmd history

prefix <.>              - copy cmdline to clipboard

prefix <n>              - display pane ids (prefix Ctrl-<n>)

prefix <K>              - kill pane
prefix <S>              - kill server
prefix Ctrl-<d>         - detach client
prefix <D>              - choose-client

prefix <w>              - tmux pane list (prefix Ctrl-<w>)
prefix <y>              - fzf popup window list
prefix <u>              - fzf popup pane list

Ctrl-Shift-<[>          - cmd history down (<Up>)
Ctrl-Shift-<]>          - cmd history up   (<Down>)
Ctrl-Shift-</>          - clear cmdline    (Ctrl-<c>)

prefix Ctrl-<x>         - execute cmd (<Enter>)

prefix <|>              - vertical split new shell (prefix Ctrl-<\>)
prefix <_>              - horizontal split new shell (prefix Ctrl-<->)

prefix <->              - delete most recent tmux buffer
prefix <=>              - choose buffer tree

Shift-<F12>             - toggle function keys

prefix <Enter>          - toggle copy-mode
prefix <BS>             - enter copy-mode
prefix <PageUp>         - enter copy-mode

In copy-mode:
<Alt-BS>                - scroll up
<Alt-Space>             - scroll down
<Alt-Enter>             - move up
<Enter>                 - move down
<Ctrl-Alt-Enter>        - exit copy-mode
2-click rt status       - exit copy-mode (also Ctrl-<q>)
Ctrl-2-click rt status  - exit copy-mode and paste selection (Alt-2-click)

2-click lt status       - exit copy-mode

In normal-mode:
2-click rt status       - paste selection
Ctrl-2-click rt status  - execute cmdline (also Alt)

2-click lt status       - clear cmdline (Ctrl-<u>)

