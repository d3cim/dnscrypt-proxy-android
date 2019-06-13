
CONFIG_FILE=/data/media/0/dnscrypt-proxy/dnscrypt-proxy.toml

  if [ -f "$CONFIG_FILE" ]; then

    # ui_print "* Backing up config file"
    # cp -afv $CONFIG_FILE $TMPDIR
    # ui_print "* Restoring config files"
    # cp -af $TMPDIR/dnscrypt-proxy.toml $CONFIG_FILE 

  else

    cp -afv /data/media/0/dnscrypt-proxy/example-dnscrypt-proxy.toml $CONFIG_FILE
    sed -i -e 's/127.0.0.1:53/127.0.0.1:5354/g' $CONFIG_FILE
    sed -i -e 's/\[::1\]:53/\[::1\]:5354/g' $CONFIG_FILE

  fi
