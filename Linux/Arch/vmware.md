# install vmware workstation on arch linux


## download

* [link](http://www.vmware.com/products/workstation/workstation-evaluation.html)


## install

* correct dependencies
  * `sudo pacman -S fuse gtkmm linux-headers`
  * aur - [ncurses5-compat-libs](https://aur.archlinux.org/packages/ncurses5-compat-libs/)

* vmware workstation
  * `sudo sh VMware-edition-version.release.architecture.bundle`

* require patching the VMCI/VSOCK sources
  * aur - [vmware-patch](https://aur.archlinux.org/packages/vmware-patch/)


# fix fail to build after Linux 4.7

* part 1
  ```
  cd /usr/lib/vmware/modules/source
  tar xf vmmon.tar
  mv vmmon.tar vmmon.old.tar
  sed -r -i -e 's/get_user_pages(_remote)*/get_user_pages_remote/g' vmmon-only/linux/hostif.c
  tar cf vmmon.tar vmmon-only
  rm -r vmmon-only
  ```

* part 2
  ```
  tar xf vmnet.tar
  mv vmnet.tar vmnet.old.tar
  sed -r -i -e 's/get_user_pages(_remote)*/get_user_pages_remote/g' vmnet-only/userif.c
  sed -i -e 's/dev->trans_start = jiffies/netif_trans_update\(dev\)/g' vmnet-only/netif.c
  tar cf vmnet.tar vmnet-only
  rm -r vmnet-only
  ```

* Or run [fix_vm_for_linux_4.7.sh](./fix_vm_for_linux_4.7.sh)
  * `sudo sh fix_vm_for_linux_4.7.sh`


## 參考網頁

* [ArchWiki](https://wiki.archlinux.org/index.php/VMware)
