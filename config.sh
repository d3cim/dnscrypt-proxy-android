##########################################################################################
#
# Magisk Module Template Config Script
# by topjohnwu
#
##########################################################################################
##########################################################################################
#
# Instructions:
#
# 1. Place your files into system folder (delete the placeholder file)
# 2. Fill in your module's info into module.prop
# 3. Configure the settings in this file (config.sh)
# 4. If you need boot scripts, add them into common/post-fs-data.sh or common/service.sh
# 5. Add your additional or modified system properties into common/system.prop
#
##########################################################################################

##########################################################################################
# Configs
##########################################################################################

# Set to true if you need to enable Magic Mount
# Most mods would like it to be enabled
AUTOMOUNT=true

# Set to true if you need to load system.prop
PROPFILE=false

# Set to true if you need post-fs-data script
POSTFSDATA=false

# Set to true if you need late_start service script
LATESTARTSERVICE=true

##########################################################################################
# Installation Message
##########################################################################################

# Set what you want to show when installing your mod

print_modname() {
  ui_print "*******************************"
  ui_print "     Magisk Module Template    "
  ui_print "*******************************"
}

##########################################################################################
# Replace list
##########################################################################################

# List all directories you want to directly replace in the system
# Check the documentations for more info about how Magic Mount works, and why you need this

# This is an example
REPLACE="
/system/app/Youtube
/system/priv-app/SystemUI
/system/priv-app/Settings
/system/framework
"

# Construct your own list here, it will override the example above
# !DO NOT! remove this if you don't need to replace anything, leave it empty as it is now
REPLACE="
"

##########################################################################################
# Permissions
##########################################################################################

set_permissions() {
  # Only some special files require specific permissions
  # The default permissions should be good enough for most cases

  # Here are some examples for the set_perm functions:

  # set_perm_recursive  <dirname>                <owner> <group> <dirpermission> <filepermission> <contexts> (default: u:object_r:system_file:s0)
  # set_perm_recursive  $MODPATH/system/lib       0       0       0755            0644

  # set_perm  <filename>                         <owner> <group> <permission> <contexts> (default: u:object_r:system_file:s0)
  # set_perm  $MODPATH/system/bin/app_process32   0       2000    0755         u:object_r:zygote_exec:s0
  # set_perm  $MODPATH/system/bin/dex2oat         0       2000    0755         u:object_r:dex2oat_exec:s0
  # set_perm  $MODPATH/system/lib/libart.so       0       0       0644

  # The following is default permissions, DO NOT remove
  set_perm_recursive  $MODPATH  0  0  0755  0644
  set_perm $MODPATH/system/xbin/dnscrypt-proxy 0 0 0755
}

##########################################################################################
# Custom Functions
##########################################################################################

# This file (config.sh) will be sourced by the main flash script after util_functions.sh
# If you need custom logic, please add them here as functions, and call these functions in
# update-binary. Refrain from adding code directly into update-binary, as it will make it
# difficult for you to migrate your modules to newer template versions.
# Make update-binary as clean as possible, try to only do function calls in it.

install_dnscrypt_proxy(){
  if [ "$ARCH" == "arm" ];then
    BINARY_PATH=$INSTALLER/binary/dnscrypt-proxy-arm
  elif [ "$ARCH" == "arm64" ];then
    BINARY_PATH=$INSTALLER/binary/dnscrypt-proxy-arm64
  fi

  CONFIG_FILE=$MODDIR/system/etc/dnscrypt-proxy/dnscrypt-proxy.toml
  CONFIG_PATH=$INSTALLER/config

  if [ -f "$CONFIG_FILE" ]; then
    ui_print "* Backing up config file"
    cp $CONFIG_FILE $TMPDIR
  fi

  unzip -o "$ZIP" 'config/*' 'binary/*' -d $INSTALLER 2>/dev/null

  ui_print "* Creating binary path"
  mkdir -p $MODPATH/system/xbin 2>/dev/null

  ui_print "* Creating config path"
  mkdir -p $MODPATH/system/etc/dnscrypt-proxy 2>/dev/null

  if [ -f "$BINARY_PATH" ]; then
    ui_print "* Copying binary for $ARCH"
    cp -af $BINARY_PATH $MODPATH/system/xbin/dnscrypt-proxy
  else
    abort "Binary file for $ARCH is missing!"
  fi

  if [ -d "$CONFIG_PATH" ]; then
    ui_print "* Copying example and license files"
    cp -af $CONFIG_PATH/* $MODPATH/system/etc/dnscrypt-proxy
  else
    abort "Config file is missing!"
  fi

  if [ ! -f "$CONFIG_FILE" ]; then
    ui_print "* Copying config files"
    cp -af $CONFIG_PATH/example-dnscrypt-proxy.toml $CONFIG_FILE
    sed -i -e 's/127.0.0.1:53/127.0.0.1:5353/g' $CONFIG_FILE
    sed -i -e 's/\[::1\]:53/\[::1\]:5353/g' $CONFIG_FILE
  else
    ui_print "* Restoring config files"
    cp -af $TMPDIR/dnscrypt-proxy.toml $CONFIG_FILE
  fi

}
