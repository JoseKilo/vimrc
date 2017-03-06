set -e

# sudo apt-get install libxpm-dev

./configure --with-features=huge \
    --enable-fail-if-missing \
    --with-x \
    --enable-multibyte \
    --enable-rubyinterp=yes \
    --disable-gui \
    --enable-luainterp=yes \
    --enable-pythoninterp=yes \
    --enable-python3interp=yes \
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
