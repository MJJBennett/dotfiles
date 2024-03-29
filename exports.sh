# General System Configuration
# Paths
export PATH="$HOME/.local/bin/:$PATH"

# No Longer Modified:
export XDG_CONFIG_HOME="$HOME/.config/"

# Not Modified:
export XDG_DATA_HOME="$HOME/.local/share"

##### RUST #####

# Rust - Environment Variables
export CARGO_HOME="$HOME/programming/install/cargo"
export RUSTUP_HOME="$HOME/programming/install/rustup"
# Rust - Paths
export PATH="$PATH:$HOME/programming/install/cargo/bin"

##### C++ #####

# C++ - Tooling - Paths
export PATH="$PATH:$HOME/programming/install/ccls/Release"

##### MISC TOOLS #####

# GPG
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export GPG_TTY=$(tty)

# Improve our home directory - random things.
# Some weird thing to help man work smoother for nobody idk
export LESSHISTFILE=-
