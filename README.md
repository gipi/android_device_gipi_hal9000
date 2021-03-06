Simple fake device tree for AOSP. For now is a simple
duplicate of the platform used with the emulator with a simple
customized launcher.

Tested on

 - android-4.2.2_r1
 - android-4.4.4_r1
 - android-4.4.4_r2

This code enable a device named "hal9000". In order to build
this device, add a manifest in .repo/local_manifests/ with the lines

    <manifest>
        <remote
            name="github"
            fetch="git://github.com/"
        />
        <project
            name="gipi/android_device_gipi_hal9000"
            path="device/gipi/hal9000"
            remote="github"
            revision="master"
        />
    </manifest>
    

and select from lunch menu the entry full_hal9000. If you want a minimal
system set

    BUILD_TINY_ANDROID := true
    
in full_hal9000.mk. The following are the steps to compile

    $ export USE_CCACHE=1
    $ export CCACHE_DIR=$PWD/.ccache
    $ source build/envsetup.sh
    $ lunch 18
    $ make -j8

In some cases the emulator is not build, you can force the building with

    $ external/qemu/android-rebuild.sh

or

    $ m -j8 emulator

If like me you have a 32 bit system you can add a local manifest
like the following


  <remove-project name="platform/prebuilts/gcc/linux-x86/arm/arm-linux-androideabi-4.6"/>
  <project
    path="prebuilts/gcc/linux-x86/arm/arm-linux-androideabi-4.6"
    name="yath/android_prebuilts_gcc_linux-x86-32_arm_arm-linux-androideabi-4.6"
    remote="github"
    revision="jellybean"
    />

It's possible to build the kernel adding the following line
to a local manifest

    <project
        name="kernel/goldfish"
        path="kernel/"
        remote="aosp"
        revision="android-goldfish-3.4"
    />

and then

    $ export ARCH=arm
    $ export SUBARCH=arm
    $ export CROSS_COMPILE=arm-linux-androideabi-
    $ make goldfish_armv7_defconfig

If you want to debug the emulator launch it as follow

    $ emulator -show-kernel -verbose -logcat "*:*" -debug all

In order to log more verbosely the init process, set ``loglevel`` to 7 in ``init.rc``.

It's possible to build the SDK using

    $ repo init -g all
    $ lunch sdk-eng && make sdk
    $ make PRODUCT-hal9000_sdk_addon-sdk_addon
    $ make -j8 sdk sdk_repo

Link
----

 - http://events.linuxfoundation.org/images/abs2013_rmunitz.pdf
 - http://www.kpbird.com/2012/11/in-depth-android-boot-sequence-process.html
 - http://community.arm.com/groups/android-community/blog/2013/09/18/from-zero-to-boot-porting-android-to-your-arm-platform
 - https://01.org/android-ia/guides/developers/get-code
 - http://www.linaro.org/blog/android-blog/androidization-of-linux-kernel/
 - http://stackoverflow.com/questions/11352709/android-device-configuration-for-aosp
 - http://www.slideshare.net/gxben/as-2013-jelly-bean-device-porting-walkthrough
 - http://stackoverflow.com/questions/11312576/how-would-i-make-an-embedded-android-os-with-just-one-app
 - http://stackoverflow.com/questions/22911156/android-open-source-setting-the-default-launcher
 - http://osxr.org/android/source
 - https://thenewcircle.com/s/post/1044/remixing_android
