#! /bin/zsh

echo "Make Tesla Camera USB"

say "发现`diskutil list | grep external | wc -l`个外置存储，开始制作特斯拉行车记录仪"

# diskutil info `diskutil list | grep "external" | awk '{print $1}'`

for dsk in `diskutil list | grep external | awk '{print $1}'`
do
  d_size=`diskutil info $dsk | grep "Disk Size" | awk '{print $3}'`
  if [[ $d_size -lt 33 ]]; then
    o_size='26g'
  else
    o_size='55g'
  fi
  diskutil partitiondisk $dsk MBR exFAT TESLA $o_size FAT32 MUSIC 0
  mkdir -p /Volumes/TESLA/TeslaCam/ /Volumes/TESLA/TeslaTrackMode/
  diskutil eject $dsk
done

say "制作完成"
echo "制作完成"
