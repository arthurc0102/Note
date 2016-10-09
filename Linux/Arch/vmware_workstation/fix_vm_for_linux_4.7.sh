cd /usr/lib/vmware/modules/source
tar xf vmmon.tar
mv vmmon.tar vmmon.old.tar
sed -r -i -e 's/get_user_pages(_remote)*/get_user_pages_remote/g' vmmon-only/linux/hostif.c
tar cf vmmon.tar vmmon-only
rm -r vmmon-only
tar xf vmnet.tar
mv vmnet.tar vmnet.old.tar
sed -r -i -e 's/get_user_pages(_remote)*/get_user_pages_remote/g' vmnet-only/userif.c
sed -i -e 's/dev->trans_start = jiffies/netif_trans_update\(dev\)/g' vmnet-only/netif.c
tar cf vmnet.tar vmnet-only
rm -r vmnet-only

echo "done"
