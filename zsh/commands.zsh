#!/usr/bin/env zsh
#
# devenv.zsh
# A helper script to quickly display versions of common development tools.
# Shows versions of Python, Node.js, npm, Yarn, Go, Rust, Git, and Docker.
# If a tool is not installed, it will be shown as "not installed" in yellow.
#

# Color codes
YELLOW="\033[33m"
RESET="\033[0m"

# Helper function: prints "name  version" or "name  not installed"
__print_component() {
	local name=$1
	local cmd=$2
	local icon=$3
	local version

	if command -v $cmd &>/dev/null; then
		case $cmd in
			python) version=$(python -V 2>&1 | grep -o '[0-9.]\+') ;;
			node) version=$(node -v | sed 's/^v//') ;;
			npm) version=$(npm -v) ;;
			yarn) version=$(yarn -v) ;;
			go) version=$(go version | grep -o 'go[0-9.]\+' | sed 's/^go//') ;;
			rustc) version=$(rustc --version | grep -o '[0-9.]\+') ;;
			git) version=$(git --version | grep -o '[0-9.]\+') ;;
			podman) version=$(podman --version | grep -o '[0-9.]\+') ;;
			docker) version=$(docker --version | grep -o '[0-9.]\+' | head -n 1) ;;
		esac
		printf "%-10s %s %s\n" "$icon $name" "$version"
	else
		printf "%-10s ${YELLOW}%s${RESET}\n" "$icon $name" "not installed"
	fi
}

devenv() {
	echo "  Development Environment:"
	echo "-----------------------------"

	__print_component "Python" python " "
	__print_component "Node" node " "
	__print_component "npm" npm " "
	__print_component "Yarn" yarn " "
	__print_component "Go" go " "
	__print_component "Rust" rustc " "
	__print_component "Git" git " "
	__print_component "Podman" podman " "
	__print_component "Docker" docker " "
}
