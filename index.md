---
layout: base
---
# AOSP practical guide

Trying to build the ``AOSP`` source code is a quest that takes time and effort
that is not always productive.

    export USE_CCACHE=1
    export CCACHE_DIR=$PWD/.ccache
    source build/envsetup.sh
    lunch 18
    make -j8

