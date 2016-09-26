# Backup ESXi's VM

> If we don't have vcenter, we can't clone vm without shutdown the vm.
> This can help us clone vm without shutdown it.


### Open ESXi's ssh

1. Configuration
2. Security Profile
3. Properties
4. SSH
5. Options
6. Start


### Backup

1. copy to ESXi server
   ```
   scp lamw-ghettoVCB.tar.gz root@<ESXi Server ip>:/vmfs/volumes/<datastore>/
   ```

2. 解壓縮：
   ```
   tar -xvf lamw-ghettoVCB-50cfd1c.tar.gz
   cd lamw-ghettoVCB-50cfd1c
   ```

3. edit [ghettoVCB-restore.sh](./ghettoVCB-restore.sh) file
   ```
   ...
   VM_BACKUP_VOLUME=/vmfs/volumes/<datastore>/<你要放備份的目錄>/
   ...
   ```

4. make backup list: new file name `list`
   ```
   [VM_name]
   [VM_name]
   [VM_name]
   [VM_name]
   ```

5. run: `./ghettoVCB-restore.sh -f list`


### 參考
1. <https://github.com/arthurc0102/learn/blob/master/VM_ESXi/ESXi_backup/backup-VM>

