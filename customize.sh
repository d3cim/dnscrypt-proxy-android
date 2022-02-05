  ui_print " "
  ui_print "******************************"
  ui_print "*   dnscrypt-proxy-android   *"
  ui_print "*           2.1.1-1          *"
  ui_print "******************************"
  ui_print "*         quindecim          *"
  ui_print "******************************"
  ui_print " "

# Get architecture specific binary file
if [ "$ARCH" == "arm" ];then
  BINARY_PATH=$MODPATH/binary/dnscrypt-proxy-arm
elif [ "$ARCH" == "arm64" ];then
  BINARY_PATH=$MODPATH/binary/dnscrypt-proxy-arm64
elif [ "$ARCH" == "x86" ];then
  BINARY_PATH=$MODPATH/binary/dnscrypt-proxy-i386
elif [ "$ARCH" == "x64" ];then
  BINARY_PATH=$MODPATH/binary/dnscrypt-proxy-x86_64
fi

# Set destination paths
CONFIG_PATH=$MODPATH/config

# Create the path for the binary file
ui_print "* Creating the binary path."
mkdir -p $MODPATH/system/bin

# Create the path for the configuration files
ui_print "* Creating the config. path."
mkdir -p /storage/emulated/0/dnscrypt-proxy

# Copy the binary files into the right folder
if [ -f "$BINARY_PATH" ]; then
ui_print "* Copying the binary files."
 cp -af $BINARY_PATH $MODPATH/system/bin/dnscrypt-proxy
else
  abort "The binary file for your $ARCH device is missing!"
fi

# Backup an existing config file before proceed
CONFIG_FILE="/storage/emulated/0/dnscrypt-proxy/dnscrypt-proxy.toml"

if [ -f "$CONFIG_FILE" ]; then
ui_print "* Backing up the existing config. file before proceed."
  cp -af  $CONFIG_FILE ${CONFIG_FILE}-`date +%Y%m%d%H%M`.bak
fi

# Copy the configuration files into the right folder
if [ -d "$CONFIG_PATH" ]; then
ui_print "* Copying the configuration files into the dnscrypt-proxy folder."
  cp -af $CONFIG_PATH/* /storage/emulated/0/dnscrypt-proxy/
else
  abort "Configuration file (.toml) is missing!"
fi

# Set the right permissions to the dnscrypt-proxy binary file
ui_print "* Setting up the right permissions to the dnscrypt-proxy binary file."
set_perm_recursive $MODPATH 0 0 0755 0755
set_perm $MODPATH/system/bin/dnscrypt-proxy 0 0 0755

# Cleanup unneeded binary files
ui_print "* Cleaning up the unnecessary files."
rm -r $MODPATH/binary
