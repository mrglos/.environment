export XDG_CONFIG_HOME="$HOME/.config"

export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

export HISTFILE="$ZDOTDIR/.zsh_history"
export HISTSIZE=50000
export SAVEHIST=10000

export EDITOR="nvim"
export VISUAL="nvim"

if [[ -t 1 ]]; then
	export LANG="en_US.UTF-8"
fi

## Podman in TOOLBX
# If we're running in a toolbox, we need to set the environment variable to use the podman socket
# This is needed because the podman socket is not available in the toolbox by default
# We can check if we're running in a toolbox by checking the presence of the /run/.toolboxenv file
# If the file exists, we're running in a toolbox and we can set the environment variable to use the podman socket
if [ -f /run/.toolboxenv ]; then
	export DOCKER_HOST="unix://$XDG_RUNTIME_DIR/podman/podman.sock"
	export KIND_EXPERIMENTAL_PROVIDER="podman"
fi

## Kind configuration
# Use podman as the ptovider for kind (instead of docker), this will allow us to use podman as the container runtime for kind clusters.
# export KIND_EXPERIMENTAL_PROVIDER="podman"

# Go
export PATH="$PATH:$(go env GOPATH)/bin"
