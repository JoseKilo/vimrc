set -e

# sudo apt-get install libxpm-dev libxt-dev

make clean

./configure --with-features=huge \
    --enable-fail-if-missing \
    --with-x \
    --enable-multibyte \
    --disable-gui \
    --enable-pythoninterp=no \
    --enable-python3interp=yes \
    --with-python3-command=python

make VIMRUNTIMEDIR=~/workspace/vim/runtime/

set +e
