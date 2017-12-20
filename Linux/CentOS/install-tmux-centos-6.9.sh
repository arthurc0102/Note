# Install tmux on Centos release 6.9

# install deps
yum install -y gcc kernel-devel make ncurses-devel

# DOWNLOAD SOURCES FOR LIBEVENT AND MAKE AND INSTALL
cd /tmp
curl -OL https://github.com/libevent/libevent/releases/download/release-2.1.8-stable/libevent-2.1.8-stable.tar.gz
tar -xf libevent-2.1.8-stable.tar.gz
cd libevent-2.1.8-stable
./configure --prefix=/usr/local
make
make install

# DOWNLOAD SOURCES FOR TMUX AND MAKE AND INSTALL

curl -OL https://github.com/tmux/tmux/releases/download/2.5/tmux-2.5.tar.gz
tar -xf tmux-2.5.tar.gz
cd tmux-2.5
LDFLAGS="-L/usr/local/lib -Wl,-rpath=/usr/local/lib" ./configure --prefix=/usr/local
make
make install

# pkill tmux
# close your terminal window (flushes cached tmux executable)
# open new shell and check tmux version
tmux -V
