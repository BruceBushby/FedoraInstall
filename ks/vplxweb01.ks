# Kickstart file automatically generated by anaconda.


# Fedora installation repo
url --url=http://dl.fedoraproject.org/pub/fedora/linux/releases/17/Fedora/x86_64/os/


# Network settings
network --onboot yes --device em1 --bootproto static --ip 88.208.234.11 --netmask 255.255.252.0 --gateway 88.208.232.1 --noipv6 --nameserver 8.8.4.4,8.8.4.4 --hostname vplxweb01.veritrack.co.uk


# Misc install settings
text
reboot
install
keyboard uk
lang en_US.UTF-8
selinux --disabled
firewall --service=ssh
timezone --utc Europe/London
authconfig --enableshadow --passalgo=sha512
rootpw  --iscrypted $6$5mNnR3aLO774kjO7$Z5gdP/k8n6fRPpTW4.U1QbYD6xoXxJzlUfTCto80IyrOUieeQ7Og3HL2bhAvVxgaVryWSk6yug4mLZ2aIDcXU.
bootloader --location=mbr --timeout=5 --driveorder=sda,sdb --append="rhgb quiet"


# Disk setup
clearpart --all --initlabel --drives=sda,sdb
zerombr

part raid.11 --size=128   --ondrive=sda
part raid.21 --size=1028 --ondrive=sda
part raid.31 --size=8224 --ondrive=sda

part raid.12 --size=128   --ondrive=sdb
part raid.22 --size=1028 --ondrive=sdb
part raid.32 --size=8224 --ondrive=sdb

raid /boot --fstype=ext4 --level=1 --device=md2 raid.11 raid.12
raid swap --level=1 --device=md1 raid.21 raid.22
raid / --fstype=ext3 --level=1 --device=md0 raid.31 raid.32



# Packages to install
%packages
@admin-tools
@base
@core
@development-libs
@development-tools
@editors
@fedora-packager
@fonts
@hardware-support
@input-methods
@milkymist
@ocaml
@online-docs
@server-cfg
@smb-server
@system-tools
@text-internet
@virtualization
@virtualization-hypervisor
mtools
xfsprogs

%end

# Interactive install
%post --log=/root/my-post-log
exec < /dev/tty3 > /dev/tty3
chvt 3
echo
echo "################################"
echo "# Running Post Configuration   #"
echo "################################"
echo 
echo 
echo -n "Press enter to continue: "
read ANSWER

%end
