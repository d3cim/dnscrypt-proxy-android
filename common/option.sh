
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


# let dnscrypt-proxy do its job only. Let Auto-redirection be done by some other application.
# ui_print " "
# ui_print " Vol+ = Auto redirect DNS request with iptables"
# ui_print " "
# ui_print " Vol- = Set DNS manually with 3rd-party app"
# ui_print " "

# if $FUNCTION; then
#   ui_print " "
#   ui_print " Auto mode"
# else
#   ui_print " "
#   ui_print " Manual mode"
#   ui_print " deleting iptables rules"
#   sed -i -e '/#IPTABLES/,$d' $TMPDIR/service.sh
#   sed -i -e "s/'127.0.0.1.*'/'127.0.0.1:53', '[::1]:53'/g" /data/media/0/dnscrypt-proxy/dnscrypt-proxy.toml
fi
