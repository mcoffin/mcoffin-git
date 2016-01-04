#!/usr/bin/env bash

# Path to the repository is relative to this script
repo_path=$(realpath `dirname $0`)

# We want to install all files that start with .git to the home directory
files_to_install=$(find "$repo_path" -type f -name ".git*" | egrep -v '.gitignore$')

# We'll be good citizens and keep an installed files manifest
install_manifest=mcoffin-git-installed.txt

# Convenience function for logging and error checking during the install
link_file() {
	full_file=$1

	# This just grabs the filename from the full path of the file
	filename="${full_file##*/}"
	target_path="$HOME/$filename"
	if [ -f $1 ] ; then
		echo "Linking file: $full_file to $target_path"
		ln -s "$full_file" "$target_path" && echo $target_path >> $install_manifest
	else 
		echo "Unable to find file to link: $1"
		echo "Continuing anyways..."

	fi
}

# If the install manifest exists, delete it
if [ -e "$install_manifest" ] ; then
	rm $install_manifest
fi

# Now actually perform the linking for all the desired files
echo "Installing files:"
echo "$files_to_install"
for file_to_install in $files_to_install ; do
	echo "Installing file: $file_to_install"
	link_file $file_to_install
done
