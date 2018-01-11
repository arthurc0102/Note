# LVM

## Base

- show vgname: `vgdiskplay`
- show lvname: `lvdiskplay`

## Extend size

```shell
## Example to extend LVM size

# disk name: /dev/sdb
# partition name: /dev/sdb1
# vgname: centos
# lvname: root

fdisk /dev/sdb
partprobe
pvcreate /dev/sdb1
vgextend centos /dev/sdb1
lvresize -l +100%FREE /dev/centos/root
xfs_growfs /dev/centos/root
df -h
```

1. create part partition: `fdisk /dev/<disk name>`

    - input `n` to create new partition
  2. input `p` to create primary partition
  3. input `t` and select to partition number
  4. input `8e` to make partition type Linux LVM
  5. input `w` to save your setting

2. `partprobe` to avoid reboot after fdisk
3. `fdisk -l` to list all partition
4. `pvcreate /dev/<partition name>` to initialize a disk or partition for use by LVM 
5. `vgextend <vgname> /dev/<partition name>` to extend
6. `lvresize -l +100%FREE /dev/<vgname>/<lvname>` to add 100% free size to LVM
7. `xfs_growfs /dev/<vgname>/<lvname>` to expand an XFS filesystem
8. `df -h` to show disk free size

## Troubleshooting

- if xfsprogs is not install: `yum install xfsprogs.x86_64 --assumeyes`

## Reference

- <https://www.rootusers.com/how-to-increase-the-size-of-a-linux-lvm-by-expanding-the-virtual-machine-disk/>
