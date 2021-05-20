set -e

# sudo apt-get install libxpm-dev libxt-dev
# sudo ln -s /usr/include/lua5.3 /usr/include/lua
# sudo ln -s /usr/lib/x86_64-linux-gnu/liblua5.3.so /usr/local/lib/liblua.so

make clean

./configure --with-features=huge \
    --enable-fail-if-missing \
    --with-x \
    --enable-multibyte \
    --disable-gui \
    --enable-luainterp=yes \
    --enable-pythoninterp=no \
    --enable-python3interp=yes \
    --with-python3-command=python3.6
    # --enable-rubyinterp=yes \
    # --enable-gtk2-check \
    # --enable-gnome-check \
    # --enable-gui=gnome2 \
    # --enable-python3interp=yes \
    # --with-python-config-dir=/usr/lib/python2.7/config \
    # --with-python3-config-dir=/usr/lib/python3.5/config \
    # --enable-perlinterp=yes \
    # --enable-gui=gtk2 \
    # --enable-cscope \
    # --prefix=/usr

# make VIMRUNTIMEDIR=/usr/share/vim/vim74/
make VIMRUNTIMEDIR=~/workspace/vim/runtime/

set +e
