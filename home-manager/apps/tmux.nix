{ config, pkgs, ... }:

{
  programs.tmux = {
    enable = true;

    terminal = "screen-256color";
    escapeTime = 0;
    #repeatTime = 600;

    prefix = "C-space";
    historyLimit = 5000;
    clock24 = true;
    
    extraConfig = ''
set -g status-position top
set -g status-style bg=colour19

# -- SSH -----------------------------------------------------------------
bind-key S command-prompt -p "host" "split-window 'ssh %1'"
bind-key C-s command-prompt -p "host" "new-window -n %1 'ssh %1'"

# -- EMACS -----------------------------------------------------------------
bind-key y new-window -n "emacs" "emacsclient -new"
bind-key C-y split-window "emacsclient -nw"

# -- copy mode -----------------------------------------------------------------

bind Enter copy-mode # enter copy mode
bind b list-buffers  # list paster buffers
bind P choose-buffer # choose which buffer to paste from

bind-key -T copy-mode s send-keys -X begin-selection
bind-key -T copy-mode r send-keys -X rectangle-toggle

# pane resizing
bind -r H resize-pane -L 2
bind -r J resize-pane -D 2
bind -r K resize-pane -U 2
bind -r L resize-pane -R 2

# window navigation
bind -r C-h previous-window # select previous window
bind -r C-l next-window     # select next window
bind Space last-window      # move to last active window

# create new session
bind C-c new-session

# find session
bind C-f command-prompt -p find-session 'switch-client -t %%'

# split current window vertically, retain current path
bind '"' split-window -h -c "#{pane_current_path}"
bind | split-window -h -c "#{pane_current_path}"
# split current window horizontally, retain current path
unbind %
bind % split-window -v -c "#{pane_current_path}"
bind - split-window -v -c "#{pane_current_path}"

# pane navigation
bind -r h select-pane -L  # move left
bind -r j select-pane -D  # move down
bind -r k select-pane -U  # move up
bind -r l select-pane -R  # move right
bind > swap-pane -D       # swap current pane with the next one
bind < swap-pane -U       # swap current pane with the previous one


# activity
set -g monitor-activity on
set -g visual-activity off
setw -g automatic-rename on

set -g status-bg default # default->transparent
set -g status-fg default # green
#set -g status-left "[#S#I#P:#{pane_height}x#{pane_width}] "

# Highlight active window
#setw -g window-status-current-fg red
#setw -g window-status-current-attr bright
setw -g window-status-current-style fg=red,bg=default,bright
set  -g pane-active-border fg=red
# indentify activity in other windows
setw -g monitor-activity on
set -g visual-activity on
setw -g window-status-activity-style bold,reverse,underscore

unbind C-b


'';
  };
}
