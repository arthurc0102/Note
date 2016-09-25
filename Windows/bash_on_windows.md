# Bash on Windows


### How to use?
* [How to Install and Use the Linux Bash Shell on Windows 10](http://www.howtogeek.com/249966/how-to-install-and-use-the-linux-bash-shell-on-windows-10/)


### Use zsh
* edit file `~/.bashrc` and add:

  ```sh
  if [ -t 1 ]: then
    exec zsh
  fi
  ```


### Open Linux gui sofeware
1. install [X server](https://sourceforge.net/projects/xming/)
2. edit file `~/.bashrc` and add:

   ```sh
   export DISPLAY=:0
   ```
