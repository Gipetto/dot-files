# Raspberry Pi Stuff

## Remote Backup

*Backup*

```
$ ssh pi@pi-in-the-hole.local "sudo dd if=/dev/mmcblk0 bs=1M | gzip -" | dd of=/Users/shawn/Documents/Backups/pihole-backup.gz
```

*Restore*

```
$ diskutil unmountDisk /dev/disk#
$ gzip -dc /Users/shawn/Documents/Backups/pihole-backup.gz | sudo dd of=/dev/rdisk# bs=1m conv=noerror,sync
```