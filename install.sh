##########################################################################################
#
# Magisk Module Installer Script
#
##########################################################################################
##########################################################################################
#
# Instructions:
#
# 1. Place your files into system folder (delete the placeholder file)
# 2. Fill in your module's info into module.prop
# 3. Configure and implement callbacks in this file
# 4. If you need boot scripts, add them into common/post-fs-data.sh or common/service.sh
# 5. Add your additional or modified system properties into common/system.prop
#
##########################################################################################

##########################################################################################
# Config Flags
##########################################################################################

# Set to true if you do *NOT* want Magisk to mount
# any files for you. Most modules would NOT want
# to set this flag to true
SKIPMOUNT=false

# Set to true if you need to load system.prop
PROPFILE=false

# Set to true if you need post-fs-data script
POSTFSDATA=false

# Set to true if you need late_start service script
LATESTARTSERVICE=false

##########################################################################################
# Replace list
##########################################################################################

# List all directories you want to directly replace in the system
# Check the documentations for more info why you would need this

# Construct your list in the following format
# This is an example
REPLACE_EXAMPLE="
/system/app/Youtube
/system/priv-app/SystemUI
/system/priv-app/Settings
/system/framework
"

# Construct your own list here
REPLACE="
"

##########################################################################################
#
# Function Callbacks
#
# The following functions will be called by the installation framework.
# You do not have the ability to modify update-binary, the only way you can customize
# installation is through implementing these functions.
#
# When running your callbacks, the installation framework will make sure the Magisk
# internal busybox path is *PREPENDED* to PATH, so all common commands shall exist.
# Also, it will make sure /data, /system, and /vendor is properly mounted.
#
##########################################################################################
##########################################################################################
#
# The installation framework will export some variables and functions.
# You should use these variables and functions for installation.
#
# ! DO NOT use any Magisk internal paths as those are NOT public API.
# ! DO NOT use other functions in util_functions.sh as they are NOT public API.
# ! Non public APIs are not guranteed to maintain compatibility between releases.
#
# Available variables:
#
# MAGISK_VER (string): the version string of current installed Magisk
# MAGISK_VER_CODE (int): the version code of current installed Magisk
# BOOTMODE (bool): true if the module is currently installing in Magisk Manager
# MODPATH (path): the path where your module files should be installed
# TMPDIR (path): a place where you can temporarily store files
# ZIPFILE (path): your module's installation zip
# ARCH (string): the architecture of the device. Value is either arm, arm64, x86, or x64
# IS64BIT (bool): true if $ARCH is either arm64 or x64
# API (int): the API level (Android version) of the device
#
# Availible functions:
#
# ui_print <msg>
#     print <msg> to console
#     Avoid using 'echo' as it will not display in custom recovery's console
#
# abort <msg>
#     print error message <msg> to console and terminate installation
#     Avoid using 'exit' as it will skip the termination cleanup steps
#
# set_perm <target> <owner> <group> <permission> [context]
#     if [context] is empty, it will default to "u:object_r:system_file:s0"
#     this function is a shorthand for the following commands
#       chown owner.group target
#       chmod permission target
#       chcon context target
#
# set_perm_recursive <directory> <owner> <group> <dirpermission> <filepermission> [context]
#     if [context] is empty, it will default to "u:object_r:system_file:s0"
#     for all files in <directory>, it will call:
#       set_perm file owner group filepermission context
#     for all directories in <directory> (including itself), it will call:
#       set_perm dir owner group dirpermission context
#
##########################################################################################
##########################################################################################
# If you need boot scripts, DO NOT use general boot scripts (post-fs-data.d/service.d)
# ONLY use module scripts as it respects the module status (remove/disable) and is
# guaranteed to maintain the same behavior in future Magisk releases.
# Enable boot scripts by setting the flags in the config section above.
##########################################################################################

# Set what you want to display when installing your module

print_modname() {
  ui_print "****************************************************"
  ui_print "     Magisk Pixel Complementary Live Wallpapers     "
  ui_print "                by @igor-dyatlov                    "
  ui_print "****************************************************"
}

# Copy/extract your module files into $MODPATH in on_install.

on_install() {
  ui_print "Installing  Module!"

  DEVICE=`getprop ro.product.device`
  RELEASE=`getprop ro.build.version.release`
  SECURITY_PATCH_VERSION=`getprop ro.build.version.security_patch`

  ui_print "Performing compatibility check..."
  ui_print "Device: "$DEVICE
  ui_print "Android version: "$RELEASE
  ui_print "Security patch version: "$SECURITY_PATCH_VERSION

  if [ $DEVICE != "sailfish" ] && [ $DEVICE != "marlin" ] && [ $DEVICE != "walleye" ] && [ $DEVICE != "taimen" ] && [ $DEVICE != "blueline" ] && [ $DEVICE != "crosshatch" ] && [ $DEVICE != "sargo" ] && [ $DEVICE != "bonito" ] && [ $DEVICE != "flame" ] && [ $DEVICE != "coral" ]; then
    abort "   => Device '"$DEVICE"' is not supported"
  fi
  
  if [ $RELEASE != "9" ] && [ $RELEASE != "10" ]; then
    abort "   => Android version '"$RELEASE"' is not supported"
  fi
  
  if [ $RELEASE == "9" ] && [ $RELEASE = "10" ]; then
    RELEASE=$RELEASE/$SECURITY_PATCH_VERSION
  fi

  ui_print "Your device is compatible. Continue with installation."
  
  # The following is the default implementation: extract $ZIPFILE/system to $MODPATH
  # Extend/change the logic to whatever you want  
case $DEVICE in
  sailfish)
    case $RELEASE in
      9)
        unzip -oq "$ZIPFILE" 'device/9/sailfish.sh' -d $TMPDIR >&2
        . $TMPDIR/device/9/sailfish.sh
      ;;
      10)
        unzip -oq "$ZIPFILE" 'device/10/sailfish.sh' -d $TMPDIR >&2
        . $TMPDIR/device/10/sailfish.sh
      ;;
      *)
        ui_print "Your device is compatible. Continue with installation."
      ;;
    esac
  ;;
  marlin)
    case $RELEASE in
      9)
        unzip -oq "$ZIPFILE" 'device/9/marlin.sh' -d $TMPDIR >&2
        . $TMPDIR/device/9/marlin.sh
      ;;
      10)
        unzip -oq "$ZIPFILE" 'device/10/marlin.sh' -d $TMPDIR >&2
        . $TMPDIR/device/10/marlin.sh
      ;;
      *)
        ui_print "Your device is compatible. Continue with installation."
      ;;
    esac
  ;;
  walleye)
    case $RELEASE in
      9)
        unzip -oq "$ZIPFILE" 'device/9/walleye.sh' -d $TMPDIR >&2
        . $TMPDIR/device/9/walleye.sh
      ;;
      10)
        unzip -oq "$ZIPFILE" 'device/10/walleye.sh' -d $TMPDIR >&2
        . $TMPDIR/device/10/walleye.sh
      ;;
      *)
        ui_print "Your device is compatible. Continue with installation."
      ;;
    esac
  ;;
  taimen)
    case $RELEASE in
      9)
        unzip -oq "$ZIPFILE" 'device/9/taimen.sh' -d $TMPDIR >&2
        . $TMPDIR/device/9/taimen.sh
      ;;
      10)
        unzip -oq "$ZIPFILE" 'device/10/taimen.sh' -d $TMPDIR >&2
        . $TMPDIR/device/10/taimen.sh
      ;;
      *)
        ui_print "Your device is compatible. Continue with installation."
      ;;
    esac
  ;;
  blueline)
    case $RELEASE in
      9)
        unzip -oq "$ZIPFILE" 'device/9/blueline.sh' -d $TMPDIR >&2
        . $TMPDIR/device/9/blueline.sh
      ;;
      10)
        unzip -oq "$ZIPFILE" 'device/10/blueline.sh' -d $TMPDIR >&2
        . $TMPDIR/device/10/blueline.sh
      ;;
      *)
        ui_print "Your device is compatible. Continue with installation."
      ;;
    esac
  ;;
  crosshatch)
    case $RELEASE in
      9)
        unzip -oq "$ZIPFILE" 'device/9/crosshatch.sh' -d $TMPDIR >&2
        . $TMPDIR/device/9/crosshatch.sh
      ;;
      10)
        unzip -oq "$ZIPFILE" 'device/10/crosshatch.sh' -d $TMPDIR >&2
        . $TMPDIR/device/10/crosshatch.sh
      ;;
      *)
        ui_print "Your device is compatible. Continue with installation."
      ;;
    esac
  ;;
  sargo)
    case $RELEASE in
      9)
        unzip -oq "$ZIPFILE" 'device/9/sargo.sh' -d $TMPDIR >&2
        . $TMPDIR/device/9/sargo.sh
      ;;
      10)
        unzip -oq "$ZIPFILE" 'device/10/sargo.sh' -d $TMPDIR >&2
        . $TMPDIR/device/10/sargo.sh
      ;;
      *)
        ui_print "Your device is compatible. Continue with installation."
      ;;
    esac
  ;;
  bonito)
    case $RELEASE in
      9)
        unzip -oq "$ZIPFILE" 'device/9/bonito.sh' -d $TMPDIR >&2
        . $TMPDIR/device/9/bonito.sh
      ;;
      10)
        unzip -oq "$ZIPFILE" 'device/10/bonito.sh' -d $TMPDIR >&2
        . $TMPDIR/device/10/bonito.sh
      ;;
      *)
        ui_print "Your device is compatible. Continue with installation."
      ;;
    esac
  ;;
  flame)
    case $RELEASE in
      10)
        unzip -oq "$ZIPFILE" 'device/10/flame.sh' -d $TMPDIR >&2
        . $TMPDIR/device/10/flame.sh
      ;;
      *)
        ui_print "Your device is compatible. Continue with installation."
      ;;
    esac
  ;;
  coral)
    case $RELEASE in
      10)
        unzip -oq "$ZIPFILE" 'device/10/coral.sh' -d $TMPDIR >&2
        . $TMPDIR/device/10/coral.sh
      ;;
      *)
        ui_print "Your device is compatible. Continue with installation."
      ;;
    esac
  ;;
  *)
  ui_print "Unsupported device."
  ;;
esac
}

# Only some special files require specific permissions
# This function will be called after on_install is done
# The default permissions should be good enough for most cases

set_permissions() {
  # The following is the default rule, DO NOT remove
  set_perm_recursive $MODPATH 0 0 0755 0644

  # Here are some examples:
  # set_perm_recursive  $MODPATH/system/lib       0     0       0755      0644
  # set_perm  $MODPATH/system/bin/app_process32   0     2000    0755      u:object_r:zygote_exec:s0
  # set_perm  $MODPATH/system/bin/dex2oat         0     2000    0755      u:object_r:dex2oat_exec:s0
  # set_perm  $MODPATH/system/lib/libart.so       0     0       0644
}

# You can add more functions to assist your custom script code
