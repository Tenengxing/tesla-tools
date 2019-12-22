#! /bin/zsh

echo "Make Tesla Camera USB"

# diskutil info `diskutil list | grep "external" | awk '{print $1}'`

diskutil eraseDisk FAT32 TESLA `diskutil list | grep "external" | awk '{print $1}'`

mkdir /Volumes/TESLA/TeslaCam/

diskutil eject /Volumes/TESLA

echo "制作完成"