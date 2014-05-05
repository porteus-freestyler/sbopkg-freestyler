config() {
  NEW="$1"
  OLD="$(dirname $NEW)/$(basename $NEW .new)"
  # If there's no config file by that name, mv it over:
  if [ ! -r $OLD ]; then
    mv $NEW $OLD
  elif [ "$(cat $OLD | md5sum)" = "$(cat $NEW | md5sum)" ]; then
    # toss the redundant copy
    rm $NEW
  fi
  # Otherwise, we leave the .new copy for the admin to consider...
}
config etc/sbopkg/sbopkg.conf.new
( cd etc/sbopkg/repos.d ; rm -rf README )
( cd etc/sbopkg/repos.d ; ln -sf /usr/doc/sbopkg-0.37.0/README-repos README )
( cd etc/sbopkg/renames.d ; rm -rf README )
( cd etc/sbopkg/renames.d ; ln -sf /usr/doc/sbopkg-0.37.0/README-renames README )
