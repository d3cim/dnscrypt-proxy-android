keytest() {
  ui_print " - Vol Key Test -"
  ui_print "   Press Vol Up:"
  (/system/bin/getevent -lc 1 2>&1 | /system/bin/grep VOLUME | /system/bin/grep " DOWN" > $INSTALLER/events) || return 1
  return 0
}

chooseport() {
  #note from chainfire @xda-developers: getevent behaves weird when piped, and busybox grep likes that even less than toolbox/toybox grep
  while (true); do
    /system/bin/getevent -lc 1 2>&1 | /system/bin/grep VOLUME | /system/bin/grep " DOWN" > $INSTALLER/events
    if (`cat $INSTALLER/events 2>/dev/null | /system/bin/grep VOLUME >/dev/null`); then
      break
    fi
  done
  if (`cat $INSTALLER/events 2>/dev/null | /system/bin/grep VOLUMEUP >/dev/null`); then
    return 0
  else
    return 1
  fi
}

chooseportold() {
  # Calling it first time detects previous input. Calling it second time will do what we want
  $KEYCHECK
  $KEYCHECK
  SEL=$?
  if [ "$1" == "UP" ]; then
    UP=$SEL
  elif [ "$1" == "DOWN" ]; then
    DOWN=$SEL
  elif [ $SEL -eq $UP ]; then
    return 0
  elif [ $SEL -eq $DOWN ]; then
    return 1
  else
    ui_print "   Vol key not detected!"
    abort "   Use name change method in TWRP"
  fi
}

# Keycheck binary by someone755 @Github, idea for code below by Zappo @xda-developers
KEYCHECK=$INSTALLER/common/keycheck
chmod 755 $KEYCHECK

if keytest; then
  FUNCTION=chooseport
else
  FUNCTION=chooseportold
  ui_print "   ! Legacy device detected! Using old keycheck method"
  ui_print " "
  ui_print "- Vol Key Programming -"
  ui_print "   Press Vol Up Again:"
  $FUNCTION "UP"
  ui_print "   Press Vol Down"
  $FUNCTION "DOWN"
fi

ui_print " "
ui_print " Vol+ = Auto redirect DNS request with iptables"
ui_print " "
ui_print " Vol- = Set DNS manually with 3rd-party app"
ui_print " "

if $FUNCTION; then
  ui_print " "
  ui_print " Auto mode"
else
  ui_print " "
  ui_print " Manual mode"
  ui_print " deleting iptables rules"
  sed -i -e '/for/,$d' $INSTALLER/common/service.sh
  sed -i -e "s/'127.0.0.1.*'/'127.0.0.1:53', '[::1]:53'/g" $MODPATH/system/etc/dnscrypt-proxy/dnscrypt-proxy.toml
fi
