
#umount ${1}*
#umount ${1}*

#rm /tmp/boot /tmp/rootfs -rf
#mkdir /tmp/boot
#mkdir /tmp/rootfs

#mount ${1}1 /tmp/boot
#mount ${1}2 /tmp/rootfs

#cp output/images/MLO /tmp/boot/ 
#cp output/images/u-boot.bin /tmp/boot/ 
#cp output/images/uImage /tmp/boot/
##rm /tmp/rootfs/lib/modules/* -rf
#tar xf output/images/rootfs.tar.bz2 -C /tmp/rootfs/


echo "Copying over boot files...."
cp output/images/MLO /media/boot/ 
cp output/images/u-boot.bin /media/boot/ 
cp output/images/uImage /media/boot/
echo "Cleaning old rootfs...."
rm /media/rootfs/* -rf
echo "Installing new rootfs...."
tar xf output/images/rootfs.tar.bz2 -C /media/rootfs/

echo "Sync and umount...."
sync
#umount ${1}*
umount /media/rootfs 
umount /media/boot
