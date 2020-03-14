#! /bin/zsh

echo "Make Tesla Camera USB"

# diskutil info `diskutil list | grep "external" | awk '{print $1}'`

diskutil partitiondisk `diskutil list | grep "external" | awk '{print $1}'` MBR FAT32 TESLA 25g FAT32 MUSIC 0

mkdir -p /Volumes/TESLA/TeslaCam/ /Volumes/TESLA/TeslaTrackMode/

diskutil eject `diskutil list | grep "external" | awk '{print $1}'`

echo "制作完成"
