#!/bin/bash

# Edit this value to change the Grub user 
# It doesn't have to be the same as an existing user on the system
grubUser='xuser'

# Check if the user is root
if [ "$USER" != "root" ]
then
	echo "Please run this script as root"
	exit
fi	

passwd="aaaa"

# Get the hashed password for the grub user
grubPassword=$(echo -e "$passwd\n$passwd" | grub-mkpasswd-pbkdf2 | grep -oE '[^ ]+$')

# Change the password for the grub user
echo "
set superusers=\"$grubUser\"  
password_pbkdf2 $grubUser $grubPassword" >> /etc/grub.d/40_custom
grub2-mkconfig -o /boot/grub/grub.cfg

# ADD --unrestricted option to the grub.cfg
sed -i 's/class os/class os --unrestricted/' /etc/grub.d/10_linux
grub2-mkconfig -o /boot/grub/grub.cfg
