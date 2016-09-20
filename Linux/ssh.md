# ssh setting


### No root login
1. Set file: `/etc/ssh/sshd_config`
2. Change `#PermitRootLogin yes` to `PermitRootLogin no`
3. Restart sshd: `systemctl restart sshd`


# 參考
1. <https://mediatemple.net/community/products/dv/204643810/how-do-i-disable-ssh-login-for-the-root-user>
