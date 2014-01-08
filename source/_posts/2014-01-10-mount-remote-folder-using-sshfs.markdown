---
layout: post
title: "Mount a remote folder using sshfs"
comments: true
categories:
- Linux
---

Install `sshfs` (SSH FileSystem) from the repositories :

  sudo apt-get install sshfs

You _will_ want to mount the directory as yourself, not root, so _append_ (-a) yourself to the `fuse` _group_ (-G) :

  sudo usermod -a -G fuse antoine

Reboot (?), or `exec su -l $USER`.

Then, you can mount :

  sshfs antoine@remote_host:/path/to/directory /path/to/local/mount/point

Add your public key (with an empty password, if you dare) to the server's `~/.ssh/authorized_keys`, and you're ready to add a line to `/etc/fstab` :

  sshfs#antoine@remote_host:/path/to/directory /path/to/local/mount/point fuse user 0 0

---

See [the original article on xmodulo](http://xmodulo.com/2013/04/how-to-mount-remote-directory-over-ssh-on-linux.html) for more information.