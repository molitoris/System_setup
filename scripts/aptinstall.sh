#!/bin/bash

# Script to install software from the apt package manager.

sudo apt-get update

install () {
# Installs software from the apt package manager
#
# SYNOPSYS
#   install <package-name>
#
# INPUT
#   -

    command -v $1 &> /dev/null

    # Note: Not all installed package are found. However, apt itself notices
    # that the packages are installed. Only the output is prolonged.
	if [ $? -ne 0 ]; then
		echo "Installing: ${1}..."
		sudo apt-get install -y $1
	else
		echo "Already installed: ${1}"
    fi
}

# Note: git is probabily already installed since it is required to clone
# the repository contianing this script.

# Miscellaneous
install git
install vim
install chromium-browser

if [ -d ~/.vim/bundle/Vundle.vim ]; then
    echo "Vundel software manager already exists"
else
    echo "Cloning Vundle software manager"
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

# graphics program
install gimp
install inkscape

# video
install vlc
install youtube-dl

# latex
install texlive-latex-extra
install texlive-science
install texlive-lang-english
install texlive-lang-german
install biber

# cloud
install nautilus-dropbox

# data science
install r-base

# PyGtkSpellCheck
install python3-gtkspellcheck


# Samba share for printer
install samba

samba_dir=${HOME}/Downloads/scan/

if [ ! -d ${samba_dir} ]; then
    echo "Creating directory: ${samba_dir}..."
    mkdir ${samba_dir}
fi

samba_path=/etc/samba/smb.conf
samba_config="
[sambashare]
    comment = Printer scan
    path = ${HOME}/Downloads/scan
    read only = no
    browsable = yes"
    
grep -qF -- "${samba_config}" "${samba_path}" | echo "${samba_config}" | sudo tee -a "${samba_path}" > /dev/null


echo ""
echo "Set a samba passowrd for the user \`${USER}\`"
sudo smbpasswd -a ${USER}
sudo service smbd restart

echo "----------------------------------------------------"
echo "Printer configuration (on the printer interface):"
echo "Set the network path to /$(hostname)/sambashare"
echo "with the username \`${USER}\` and the above set password"
echo "----------------------------------------------------"
