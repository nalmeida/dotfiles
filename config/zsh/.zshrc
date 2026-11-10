# Starship ----------------------------------
export STARSHIP_CONFIG="$HOME/github.com/nalmeida/dotfiles/config/starship/starship.toml"
eval "$(starship init zsh)"
# starship config palette $STARSHIP_THEME


# fnm (Fast Node Manager) ----------------------------------
# https://github.com/Schniz/fnm
# Reads .nvmrc / .node-version and switches Node version on cd
eval "$(fnm env --use-on-cd --version-file-strategy=recursive --shell zsh)"

# nvm compatibility shim: translates common nvm commands to fnm and prints
# the fnm equivalent (to stderr) so the new syntax can be learned over time.
nvm() {
	local cmd="$1"; shift 2>/dev/null
	local -a fnm_args

	case "$cmd" in
		install|i)
			case "$1" in
				--lts|lts/*) fnm_args=(install --lts) ;;
				node)        fnm_args=(install --latest) ;;
				*)           fnm_args=(install "$@") ;;
			esac
			;;
		use)
			case "$1" in
				--lts|lts/*) fnm_args=(use lts-latest) ;;
				*)           fnm_args=(use "$@") ;;
			esac
			;;
		ls|list)               fnm_args=(list) ;;
		ls-remote|list-remote) fnm_args=(list-remote "$@") ;;
		current)               fnm_args=(current) ;;
		uninstall)             fnm_args=(uninstall "$@") ;;
		unalias)               fnm_args=(unalias "$@") ;;
		alias)
			if [[ "$1" == "default" && -n "$2" ]]; then
				fnm_args=(default "$2")
			elif [[ -n "$1" && -n "$2" ]]; then
				# nvm: alias <name> <version>  |  fnm: alias <version> <name>
				fnm_args=(alias "$2" "$1")
			else
				print -u2 "nvm shim: list aliases with 'fnm list' (aliases are shown next to each version)"
				return 1
			fi
			;;
		exec)
			local version="$1"; shift
			fnm_args=(exec --using="$version" "$@")
			;;
		run)
			local version="$1"; shift
			fnm_args=(exec --using="$version" node "$@")
			;;
		which)
			fnm_args=(exec --using="${1:-default}" which node)
			;;
		version|--version|-v)  fnm_args=(--version) ;;
		install-latest-npm)
			print -u2 "→ npm install -g npm@latest"
			npm install -g npm@latest
			return
			;;
		""|help|--help|-h)
			cat <<-'EOF'
			nvm is not installed: this is a shim that translates nvm commands to fnm.
			fnm (Fast Node Manager): https://github.com/Schniz/fnm

			Each command prints its fnm equivalent (→ fnm ...) and then runs it.

			  nvm install [ver|--lts|node]   → fnm install [ver|--lts|--latest]
			  nvm use [ver|--lts]            → fnm use [ver|lts-latest]
			  nvm ls                         → fnm list
			  nvm ls-remote [--lts]          → fnm list-remote [--lts]
			  nvm current                    → fnm current
			  nvm uninstall <ver>            → fnm uninstall <ver>
			  nvm alias default <ver>        → fnm default <ver>
			  nvm alias <name> <ver>         → fnm alias <ver> <name>   (order is swapped)
			  nvm unalias <name>             → fnm unalias <name>
			  nvm exec <ver> <cmd>           → fnm exec --using=<ver> <cmd>
			  nvm run <ver> <script>         → fnm exec --using=<ver> node <script>
			  nvm which [ver]                → fnm exec --using=<ver> which node
			  nvm install-latest-npm         → npm install -g npm@latest

			Not supported: deactivate, reinstall-packages, cache.
			Version switches automatically on cd when a .nvmrc / .node-version exists.

			Full fnm help: fnm --help
			EOF
			return
			;;
		*)
			print -u2 "nvm shim: 'nvm $cmd' has no fnm equivalent. See 'fnm --help'."
			return 1
			;;
	esac

	print -u2 "→ fnm ${fnm_args[*]}"
	fnm "${fnm_args[@]}"
}


# zsh-autosuggestions ----------------------------------
# https://github.com/zsh-users/zsh-autosuggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# zsh-syntax-highlighting ----------------------------------
# https://github.com/zsh-users/zsh-syntax-highlighting
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Claude Code CLI bundled with the Claude desktop app (version-independent)
C() { "$(ls -d "$HOME/Library/Application Support/Claude/claude-code"/*/*/claude.app/Contents/MacOS/claude | sort -V | tail -1)" "$@"; }
