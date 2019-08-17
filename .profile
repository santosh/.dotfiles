# ~/.profile is shell agnostic version of .bash_profile and .zprofile
# It is source before any of those, then sourced either
# of those depending on corresponding shells.

# Uncomment if dolphin is still giving unreadable label
# export XDG_CURRENT_DESKTOP=kde

# Turn numlock on, needs numlockx to be installed
numlockx on
export PATH="$HOME/.cargo/bin:$PATH"
