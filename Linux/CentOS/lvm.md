# 放大 LV 容量

> new disk = sdb
> vgname = centos
> lvname = root

```
$ fdisk /dev/sdb
$ partprobe
$ pvcreate /dev/sdb1
$ vgextend $vg_name /dev/sdb1
$ lvresize -l +100%FREE /dev/vg_name/lvname
$ xfs_growfs /dev/vg_name/lvname
$ df -h
```

## 如果沒裝 xfsprogs

```
$ sudo yum install xfsprogs.x86_64 --assumeyes
```
