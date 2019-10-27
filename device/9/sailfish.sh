#!/bin/bash

ui_print "Downloading module files for '"$DEVICE"' and Android Version '"$RELEASE"'"
  ui_print "Check Internet connection..."
  wget -q --tries=10 --timeout=20 --spider http://google.com
  if [[ $? -eq 0 ]]; then
    ui_print "Successful connection, start downloading..."
    ui_print "File downloading (1/6)..."
      mkdir -p $TMPDIR/$RELEASE/walleye/NexusWallpapersStubPrebuilt2017
      wget -P $TMPDIR/$RELEASE/walleye/NexusWallpapersStubPrebuilt2017 https://gitlab.com/igor-dyatlov/pixel-complementary-live-wallpapers/raw/master/$RELEASE/$SECURITY_PATCH_VERSION/walleye/NexusWallpapersStubPrebuilt2017/NexusWallpapersStubPrebuilt2017.apk
    ui_print "File downloading (2/6)..."
      mkdir -p $TMPDIR/$RELEASE/blueline/NexusWallpapersStubPrebuilt2018
      wget -P $TMPDIR/$RELEASE/blueline/NexusWallpapersStubPrebuilt2018 https://gitlab.com/igor-dyatlov/pixel-complementary-live-wallpapers/raw/master/$RELEASE/$SECURITY_PATCH_VERSION/blueline/NexusWallpapersStubPrebuilt2018/NexusWallpapersStubPrebuilt2018.apk
    ui_print "File downloading (3/6)..."
      mkdir -p $TMPDIR/$RELEASE/walleye/WallpapersBReel2017/lib/arm64
      wget -P $TMPDIR/$RELEASE/walleye/WallpapersBReel2017 https://gitlab.com/igor-dyatlov/pixel-complementary-live-wallpapers/raw/master/$RELEASE/$SECURITY_PATCH_VERSION/walleye/WallpapersBReel2017/WallpapersBReel2017.apk
    ui_print "File downloading (4/6)..."
      wget -P $TMPDIR/$RELEASE/walleye/WallpapersBReel2017/lib/arm64 https://gitlab.com/igor-dyatlov/pixel-complementary-live-wallpapers/raw/master/$RELEASE/$SECURITY_PATCH_VERSION/walleye/WallpapersBReel2017/lib/arm64/libgdx.so
    ui_print "File downloading (5/6)..."
      wget -P $TMPDIR/$RELEASE/walleye/WallpapersBReel2017/lib/arm64 https://gitlab.com/igor-dyatlov/pixel-complementary-live-wallpapers/raw/master/$RELEASE/$SECURITY_PATCH_VERSION/walleye/WallpapersBReel2017/lib/arm64/libwallpapers-breel-jni.so
    ui_print "File downloading (6/6)..."
      mkdir -p $TMPDIR/$RELEASE/blueline/WallpapersBReel2018
      wget -P $TMPDIR/$RELEASE/blueline/WallpapersBReel2018 https://gitlab.com/igor-dyatlov/pixel-complementary-live-wallpapers/raw/master/$RELEASE/$SECURITY_PATCH_VERSION/blueline/WallpapersBReel2018/WallpapersBReel2018.apk
    ui_print "Download complete."
  else
    abort "Internet connection is not available. Check the connection and try again."
  fi
  APK_PATH_PX2_W=$TMPDIR/$RELEASE/walleye/NexusWallpapersStubPrebuilt2017/NexusWallpapersStubPrebuilt2017.apk
  APK_PATH_PX3_W=$TMPDIR/$RELEASE/blueline/NexusWallpapersStubPrebuilt2018/NexusWallpapersStubPrebuilt2018.apk
  LIB_PATH_PX2_D=$TMPDIR/$RELEASE/walleye/WallpapersBReel2017/lib/arm64/libgdx.so
  LIB_PATH_PX2_B=$TMPDIR/$RELEASE/walleye/WallpapersBReel2017/lib/arm64/libwallpapers-breel-jni.so
  APK_PATH_PX2_LW=$TMPDIR/$RELEASE/walleye/WallpapersBReel2017/WallpapersBReel2017.apk
  APK_PATH_PX3_LW=$TMPDIR/$RELEASE/blueline/WallpapersBReel2018/WallpapersBReel2018.apk
  ui_print "Installation..."
  mkdir -p $MODPATH/system/app/NexusWallpapersStubPrebuilt2017
  cp -af $APK_PATH_PX2_W $MODPATH/system/app/NexusWallpapersStubPrebuilt2017/NexusWallpapersStubPrebuilt2017.apk
  mkdir -p $MODPATH/system/app/NexusWallpapersStubPrebuilt2018
  cp -af $APK_PATH_PX3_W $MODPATH/system/app/NexusWallpapersStubPrebuilt2018/NexusWallpapersStubPrebuilt2018.apk
  mkdir -p $MODPATH/system/app/WallpapersBReel2017/lib/arm64
  cp -af $LIB_PATH_PX2_D $MODPATH/system/app/WallpapersBReel2017/lib/arm64/libgdx.so
  cp -af $LIB_PATH_PX2_B $MODPATH/system/app/WallpapersBReel2017/lib/arm64/libwallpapers-breel-jni.so
  cp -af $APK_PATH_PX2_LW $MODPATH/system/app/WallpapersBReel2017/WallpapersBReel2017.apk
  mkdir -p $MODPATH/system/app/WallpapersBReel2018
  cp -af $APK_PATH_PX3_LW $MODPATH/system/app/WallpapersBReel2018/WallpapersBReel2018.apk
  ui_print "Installation complete."