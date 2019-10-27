#!/bin/bash

ui_print "Downloading module files for '"$DEVICE"' and Android Version '"$RELEASE"'"
  ui_print "Check Internet connection..."
  wget -q --tries=10 --timeout=20 --spider http://google.com
  if [[ $? -eq 0 ]]; then
    ui_print "Successful connection, start downloading..."
    ui_print "File downloading (1/12)..."
      mkdir -p $TMPDIR/$RELEASE/sailfish/NexusWallpapersStubPrebuilt
      wget -P $TMPDIR/$RELEASE/sailfish/NexusWallpapersStubPrebuilt https://gitlab.com/igor-dyatlov/pixel-complementary-live-wallpapers/raw/master/$RELEASE/$SECURITY_PATCH_VERSION/sailfish/NexusWallpapersStubPrebuilt/NexusWallpapersStubPrebuilt.apk
    ui_print "File downloading (2/12)..."
      mkdir -p $TMPDIR/$RELEASE/blueline/NexusWallpapersStubPrebuilt2018
      wget -P $TMPDIR/$RELEASE/blueline/NexusWallpapersStubPrebuilt2018 https://gitlab.com/igor-dyatlov/pixel-complementary-live-wallpapers/raw/master/$RELEASE/$SECURITY_PATCH_VERSION/blueline/NexusWallpapersStubPrebuilt2018/NexusWallpapersStubPrebuilt2018.apk
          case $SECURITY_PATCH_VERSION in
      2019-10-06)
        ui_print "File downloading (2.1/11)..."
        mkdir -p $TMPDIR/$RELEASE/flame/NexusWallpapersStubPrebuilt2019
        wget -P $TMPDIR/$RELEASE/flame/NexusWallpapersStubPrebuilt2019 https://gitlab.com/igor-dyatlov/pixel-complementary-live-wallpapers/raw/master/$RELEASE/$SECURITY_PATCH_VERSION/flame/NexusWallpapersStubPrebuilt2019/NexusWallpapersStubPrebuilt2019.apk
      ;;
      *)
        ui_print "This security patch does not support this wallpaper."
      ;;
    esac
    ui_print "File downloading (3/12)..."
      mkdir -p $TMPDIR/$RELEASE/sailfish/WallpapersBReel/lib/arm64
      wget -P $TMPDIR/$RELEASE/sailfish/WallpapersBReel https://gitlab.com/igor-dyatlov/pixel-complementary-live-wallpapers/raw/master/$RELEASE/$SECURITY_PATCH_VERSION/sailfish/WallpapersBReel/WallpapersBReel.apk
    ui_print "File downloading (4/12)..."
      wget -P $TMPDIR/$RELEASE/sailfish/WallpapersBReel/lib/arm64 https://gitlab.com/igor-dyatlov/pixel-complementary-live-wallpapers/raw/master/$RELEASE/$SECURITY_PATCH_VERSION/sailfish/WallpapersBReel/lib/arm64/libgdx.so
    ui_print "File downloading (5/12)..."
      wget -P $TMPDIR/$RELEASE/sailfish/WallpapersBReel/lib/arm64 https://gitlab.com/igor-dyatlov/pixel-complementary-live-wallpapers/raw/master/$RELEASE/$SECURITY_PATCH_VERSION/sailfish/WallpapersBReel/lib/arm64/libgeswallpapers-jni.so
    ui_print "File downloading (6/12)..."  
      mkdir -p $TMPDIR/$RELEASE/sailfish/WallpapersUsTwo
      wget -P $TMPDIR/$RELEASE/sailfish/WallpapersUsTwo https://gitlab.com/igor-dyatlov/pixel-complementary-live-wallpapers/raw/master/$RELEASE/$SECURITY_PATCH_VERSION/sailfish/WallpapersUsTwo/WallpapersUsTwo.apk
    ui_print "File downloading (7/12)..."
      mkdir -p $TMPDIR/$RELEASE/blueline/WallpapersBReel2018/lib/arm64 $TMPDIR/$RELEASE/blueline/WallpapersBReel2018/oat/arm64
      wget -P $TMPDIR/$RELEASE/blueline/WallpapersBReel2018 https://gitlab.com/igor-dyatlov/pixel-complementary-live-wallpapers/raw/master/$RELEASE/$SECURITY_PATCH_VERSION/blueline/WallpapersBReel2018/WallpapersBReel2018.apk
    ui_print "File downloading (8/12)..."
      wget -P $TMPDIR/$RELEASE/blueline/WallpapersBReel2018/lib/arm64 https://gitlab.com/igor-dyatlov/pixel-complementary-live-wallpapers/raw/master/$RELEASE/$SECURITY_PATCH_VERSION/blueline/WallpapersBReel2018/lib/arm64/libgdx.so
    ui_print "File downloading (8/12)..."
      wget -P $TMPDIR/$RELEASE/blueline/WallpapersBReel2018/lib/arm64 https://gitlab.com/igor-dyatlov/pixel-complementary-live-wallpapers/raw/master/$RELEASE/$SECURITY_PATCH_VERSION/blueline/WallpapersBReel2018/lib/arm64/libwallpapers-breel-2018-jni.so
    ui_print "File downloading (10/12)..."
      wget -P $TMPDIR/$RELEASE/blueline/WallpapersBReel2018/oat/arm64 https://gitlab.com/igor-dyatlov/pixel-complementary-live-wallpapers/raw/master/$RELEASE/$SECURITY_PATCH_VERSION/blueline/WallpapersBReel2018/oat/arm64/WallpapersBReel2018.odex
    ui_print "File downloading (11/12)..."
      wget -P $TMPDIR/$RELEASE/blueline/WallpapersBReel2018/oat/arm64 https://gitlab.com/igor-dyatlov/pixel-complementary-live-wallpapers/raw/master/$RELEASE/$SECURITY_PATCH_VERSION/blueline/WallpapersBReel2018/oat/arm64/WallpapersBReel2018.vdex
    ui_print "File downloading (12/12)..."
        case $SECURITY_PATCH_VERSION in
      2019-10-06)
        ui_print "File downloading (11.1/11)..."
          mkdir -p $TMPDIR/$RELEASE/flame/WallpapersBReel2019/lib/arm64 $TMPDIR/$RELEASE/flame/WallpapersBReel2019/oat/arm64
          wget -P $TMPDIR/$RELEASE/flame/WallpapersBReel2019 https://gitlab.com/igor-dyatlov/pixel-complementary-live-wallpapers/raw/master/$RELEASE/$SECURITY_PATCH_VERSION/flame/WallpapersBReel2019/WallpapersBReel2019.apk
        ui_print "File downloading (11.2/11)..."
          wget -P $TMPDIR/$RELEASE/flame/WallpapersBReel2019/lib/arm64 https://gitlab.com/igor-dyatlov/pixel-complementary-live-wallpapers/raw/master/$RELEASE/$SECURITY_PATCH_VERSION/flame/WallpapersBReel2019/lib/arm64/libgdx.so
        ui_print "File downloading (11.3/11)..."
          wget -P $TMPDIR/$RELEASE/flame/WallpapersBReel2019/oat/arm64 https://gitlab.com/igor-dyatlov/pixel-complementary-live-wallpapers/raw/master/$RELEASE/$SECURITY_PATCH_VERSION/flame/WallpapersBReel2019/oat/arm64/WallpapersBReel2019.odex
        ui_print "File downloading (11.4/11)..."
          wget -P $TMPDIR/$RELEASE/flame/WallpapersBReel2019/oat/arm64 https://gitlab.com/igor-dyatlov/pixel-complementary-live-wallpapers/raw/master/$RELEASE/$SECURITY_PATCH_VERSION/flame/WallpapersBReel2019/oat/arm64/WallpapersBReel2019.vdex
      ;;
      *)
        ui_print "This security patch does not support this wallpaper."
      ;;
    esac
  ui_print "Download complete."
  else
    abort "Internet connection is not available. Check the connection and try again."
  fi
  APK_PATH_PX1_W=$TMPDIR/$RELEASE/sailfish/NexusWallpapersStubPrebuilt/NexusWallpapersStubPrebuilt.apk
  APK_PATH_PX3_W=$TMPDIR/$RELEASE/blueline/NexusWallpapersStubPrebuilt2018/NexusWallpapersStubPrebuilt2018.apk
  case $SECURITY_PATCH_VERSION in
      2019-10-06)
        APK_PATH_PX4_W=$TMPDIR/$RELEASE/flame/NexusWallpapersStubPrebuilt2019/NexusWallpapersStubPrebuilt2019.apk
      ;;
      *)
        ui_print "This security patch does not support this wallpaper."
      ;;
    esac
  LIB_PATH_PX1_D=$TMPDIR/$RELEASE/sailfish/WallpapersBReel/lib/arm64/libgdx.so
  LIB_PATH_PX1_B=$TMPDIR/$RELEASE/sailfish/WallpapersBReel/lib/arm64/libgeswallpapers-jni.so
  APK_PATH_PX1_LW1=$TMPDIR/$RELEASE/sailfish/WallpapersBReel/WallpapersBReel.apk
  APK_PATH_PX1_LW2=$TMPDIR/$RELEASE/sailfish/WallpapersUsTwo/WallpapersUsTwo.apk
  LIB_PATH_PX3_D=$TMPDIR/$RELEASE/blueline/WallpapersBReel2018/lib/arm64/libgdx.so
  LIB_PATH_PX3_B=$TMPDIR/$RELEASE/blueline/WallpapersBReel2018/lib/arm64/libwallpapers-breel-2018-jni.so
  OAT_PATH_PX3_O=$TMPDIR/$RELEASE/blueline/WallpapersBReel2018/oat/arm64/WallpapersBReel2018.odex
  OAT_PATH_PX3_V=$TMPDIR/$RELEASE/blueline/WallpapersBReel2018/oat/arm64/WallpapersBReel2018.vdex
  APK_PATH_PX3_LW=$TMPDIR/$RELEASE/blueline/WallpapersBReel2018/WallpapersBReel2018.apk
  case $SECURITY_PATCH_VERSION in
      2019-10-06)
        LIB_PATH_PX4_D=$TMPDIR/$RELEASE/flame/WallpapersBReel2019/lib/arm64/libgdx.so
        OAT_PATH_PX4_O=$TMPDIR/$RELEASE/flame/WallpapersBReel2019/oat/arm64/WallpapersBReel2019.odex
        OAT_PATH_PX4_V=$TMPDIR/$RELEASE/flame/WallpapersBReel2019/oat/arm64/WallpapersBReel2019.vdex
        APK_PATH_PX4_LW=$TMPDIR/$RELEASE/flame/WallpapersBReel2019/WallpapersBReel2019.apk
      ;;
      *)
        ui_print "This security patch does not support this wallpaper."
      ;;
    esac
  ui_print "Installation..."
  mkdir -p $MODPATH/system/app/NexusWallpapersStubPrebuilt
  cp -af $APK_PATH_PX1_W $MODPATH/system/app/NexusWallpapersStubPrebuilt/NexusWallpapersStubPrebuilt.apk
  mkdir -p $MODPATH/system/app/NexusWallpapersStubPrebuilt2018
  cp -af $APK_PATH_PX3_W $MODPATH/system/app/NexusWallpapersStubPrebuilt2018/NexusWallpapersStubPrebuilt2018.apk
      case $SECURITY_PATCH_VERSION in
      2019-10-06)
        mkdir -p $MODPATH/system/app/NexusWallpapersStubPrebuilt2019
        cp -af $APK_PATH_PX4_W $MODPATH/system/app/NexusWallpapersStubPrebuilt2019/NexusWallpapersStubPrebuilt2019.apk
      ;;
      *)
        ui_print "This security patch does not support this wallpaper."
      ;;
    esac
  mkdir -p $MODPATH/system/app/WallpapersBReel/lib/arm64
  cp -af $LIB_PATH_PX1_D $MODPATH/system/app/WallpapersBReel/lib/arm64/libgdx.so
  cp -af $LIB_PATH_PX1_B $MODPATH/system/app/WallpapersBReel/lib/arm64/libgeswallpapers-jni.so
  cp -af $APK_PATH_PX1_LW1 $MODPATH/system/app/WallpapersBReel/WallpapersBReel.apk
  mkdir -p $MODPATH/system/app/WallpapersUsTwo
  cp -af $APK_PATH_PX1_LW2 $MODPATH/system/app/WallpapersUsTwo/WallpapersUsTwo.apk
  mkdir -p $MODPATH/system/app/WallpapersBReel2018/lib/arm64 $MODPATH/system/app/WallpapersBReel2018/oat/arm64
  cp -af $LIB_PATH_PX3_D $MODPATH/system/app/WallpapersBReel2018/lib/arm64/libgdx.so
  cp -af $LIB_PATH_PX3_B $MODPATH/system/app/WallpapersBReel2018/lib/arm64/libwallpapers-breel-2018-jni.so
  cp -af $OAT_PATH_PX3_O $MODPATH/system/app/WallpapersBReel2018/oat/arm64/WallpapersBReel2018.odex
  cp -af $OAT_PATH_PX3_V $MODPATH/system/app/WallpapersBReel2018/oat/arm64/WallpapersBReel2018.vdex
  cp -af $APK_PATH_PX3_LW $MODPATH/system/app/WallpapersBReel2018/WallpapersBReel2018.apk
  case $SECURITY_PATCH_VERSION in
      2019-10-06)
        mkdir -p $MODPATH/system/app/WallpapersBReel2019/lib/arm64 $MODPATH/system/app/WallpapersBReel2019/oat/arm64
        cp -af $LIB_PATH_PX4_D $MODPATH/system/app/WallpapersBReel2019/lib/arm64/libgdx.so
        cp -af $OAT_PATH_PX4_O $MODPATH/system/app/WallpapersBReel2019/oat/arm64/WallpapersBReel2019.odex
        cp -af $OAT_PATH_PX4_V $MODPATH/system/app/WallpapersBReel2019/oat/arm64/WallpapersBReel2019.vdex
        cp -af $APK_PATH_PX4_LW $MODPATH/system/app/WallpapersBReel2019/WallpapersBReel2019.apk
      ;;
      *)
        ui_print "This security patch does not support this wallpaper."
      ;;
    esac
  ui_print "Installation complete."