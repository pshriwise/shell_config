
# Directory Visibility

Ples will not allow the addition of media directories without the right
properties. To provide these properties, do the following:

  1. Make the directory path owned by the plex user

```bash
$ sudo chown -R plex:plex /path/to/plex/media
```

  2. Set permissions

```bash
$ sudo chmod -R 755 /path/to/plex/media
```

  3. (Optional) For media access by the current user:

```bash
$ sudo usermod -aG plex $USER
```

# Filesystem mounting

If using external hard drives, they should be mounted to another location on the
filesystem so they can be found reliably by the plex server. To do this an entry
needs to be added to the filesystem table (fstab) often located at `/etc/fstab`.


For example, if a drive is mounted at /media/pshriwise/loco then an entry can be
added to `etc/fstab` to provide those files at a new location `/mnt/plex/loco`
with the following

```bash
/media/pshriwise/loco /mnt/plex/loco none bind 0 0
```