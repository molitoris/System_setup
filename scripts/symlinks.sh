#!/bin/bash

# Create symbolic link in the home directory to the files which are
# stored in the directory `dotfiles`.

# Set current working directory to directory of the script
cd "${0%/*}"

if [ ! -d "../dotfiles/" ]; then
    echo "Directory 'dotfiles' does not exist"
    exit 1
fi

# Change to dotfiles directory
cd ../dotfiles/


dotfilesDir=$(pwd)

linkDotfile () {
# Create a symbolik link in the home directory for all passed files
#
# SYNOMSYS
#   linkDotfile .test
#
# INPUT
#   1   absolute path to file to which a symbolic link shall be created

    dest="${HOME}/${1}"
    dateStr=$(date +%Y-%m-%d-%H%M)

    if [ -L ~/${1} ]; then
        # dest exists as symlink
        echo "Removing existing symlink: ${dest}"
        rm ${dest}

    elif [ -f "${dest}" ]; then
        # dest exists as file
        echo "Backing up existing file: ${dest}"
        mv ${dest}{,.${dateStr}}

    elif [ -d "${dest}" ]; then
        # dest exists as directory
        echo "Backing up existing dir: ${dest}"
        mv ${dest}{,.${dateStr}}
    fi

    echo "Creating new symlink: ${dest}"
    ln -s ${dotfilesDir}/${1} ${dest}
}


# Create symlink for all files in the dotfile dir
for dotfile in "${dotfilesDir}"/.*
do
    if [ -f "$dotfile" ]; then
        linkDotfile "$(basename -- $dotfile)"
    fi
done
