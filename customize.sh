  ui_print " "
  ui_print "******************************"
  ui_print "*   dnscrypt-proxy-android   *"
  ui_print "*           2.0.36           *"
  ui_print "******************************"
  ui_print "*         quindecim          *"
  ui_print "******************************"
  ui_print " "


  if [ "$ARCH" == "arm" ];then
    BINARY_PATH=$TMPDIR/binary/dnscrypt-proxy-arm
  elif [ "$ARCH" == "arm64" ];then
    BINARY_PATH=$TMPDIR/binary/dnscrypt-proxy-arm64
  elif [ "$ARCH" == "x86" ];then
    BINARY_PATH=$TMPDIR/binary/dnscrypt-proxy-i386
  elif [ "$ARCH" == "x64" ];then
    BINARY_PATH=$TMPDIR/binary/dnscrypt-proxy-x86_64
  fi

  CONFIG_PATH=$TMPDIR/config

  unzip -o "$ZIPFILE" 'config/*' 'binary/*' -d $TMPDIR

  ui_print "* Creating binary path"
  mkdir -p $MODPATH/system/bin

  ui_print "* Creating config path"
  mkdir -p /data/media/0/dnscrypt-proxy

  if [ -f "$BINARY_PATH" ]; then
    ui_print "* Copying binary for $ARCH"
    cp -afv $BINARY_PATH $MODPATH/system/bin/dnscrypt-proxy
  else
    abort "Binary file for $ARCH is missing!"
  fi


# Backup an existing config file before proceed | quindecim

CONFIG_FILE="/data/media/0/dnscrypt-proxy/dnscrypt-proxy.toml"

  if [ -f "$CONFIG_FILE" ]; then
    ui_print "* Backing up config file"
    cp -afv  $CONFIG_FILE ${CONFIG_FILE}-`date +%Y%m%d%H%M`.bak
  fi

  if [ -d "$CONFIG_PATH" ]; then
    ui_print "* Copying config, example and license files"
    cp -af $CONFIG_PATH/* /data/media/0/dnscrypt-proxy/
  else
    abort "Config file is missing!"
  fi


# Only some special files require specific permissions
# This function will be called after on_install is done
# The default permissions should be good enough for most cases

  set_perm_recursive $MODPATH 0 0 0755 0755
  set_perm $MODPATH/system/bin/dnscrypt-proxy 0 0 0755
