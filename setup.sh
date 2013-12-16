#!/bin/bash

function msg_log()      { echo -e " \033[1;33m*\033[0m  $@"; }
function msg_success()  { echo -e " \033[1;32m✔\033[0m  $@"; }
function msg_error()    { echo -e " \033[1;31m✖\033[0m  $@"; }
function msg_arrow()    { echo -e " \033[1;33m➜\033[0m  $@"; }

FILES=(".aliases" ".bash_profile" ".bash_prompt" ".exports" ".extras" ".gitconfig" ".gitignore" "bin")
DO_BACKUP="no"
FOLDER_NAME="dotfiles-backup-"$(date +"%Y%m%d%H%M")

confirm() {
	read -p "[?] This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
	echo
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt
	else
		msg_error "Install aborted"
	fi
}

doIt() {
	backup
	download
	permissions
	restore

	msg_success "Done"
}

banner() {
	# @see http://patorjk.com/software/taag/#p=display&f=Small%20Slant&t=dotfiles%0A
	echo "      __     __  ____ __      "
	echo "  ___/ /__  / /_/ _(_) /__ ___"
	echo " / _  / _ \/ __/ _/ / / -_|_-<"
	echo " \_,_/\___/\__/_//_/_/\__/___/"
	echo "                              "
}

backup() {
	for i in "${FILES[@]}"
	do
			if [ -f $i ] || [ -d $i ]; then
					if [ "$DO_BACKUP" = "no" ]; then
						DO_BACKUP="yes"
						msg_log "Creading backup folder: $FOLDER_NAME"
						mkdir $FOLDER_NAME
						msg_log "Backing up dotfiles"
					fi
			fi

			test -f $i && cp $i $FOLDER_NAME/$i && msg_log " copying $i to $FOLDER_NAME/$i"
			test -d $i && cp -r $i $FOLDER_NAME/$i && msg_log " copying $i to $FOLDER_NAME/$i"

	done
	if [ "$DO_BACKUP" = "yes" ]; then
	msg_success "Backup complete!"
	fi
}

download() {
	msg_log "Downloading files from Github"
	curl -#L https://github.com/nalmeida/dotfiles/tarball/master | tar -xzv --strip-components 1 --exclude={README.md,sample.png,setup.sh,Tomorrow-Night.terminal}
	msg_success "Download and extraction complete"
}

permissions() {
	msg_log "Setting permisions"

	msg_log " setting executable permission to .bash_profile"
	chmod +x .bash_profile

	msg_log " setting executable permission to bin/*"
	chmod -R +x bin/*

	msg_success "Permissions Ok"

	source .bash_profile
}

restore() {
	test -f "$FOLDER_NAME/.extras" && msg_log "Restoring .extras file" && cp "$FOLDER_NAME/.extras" ".extras" && msg_success ".extras restored"
}

main() {
	banner
	confirm
}

main