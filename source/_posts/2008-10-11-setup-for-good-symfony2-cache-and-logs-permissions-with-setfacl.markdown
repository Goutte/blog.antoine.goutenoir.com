---
layout: post
title: "Setup (for good) Symfony2 cache and logs permissions with setfacl"
comments: true
categories:
- Linux
- Tips
- Snippet

---

`chmod` is not enough, sometimes.
Therefore, we need to adapt our access control lust <small>(see what I did there ?)</small> for our `www-data` user.

This may or may not be the best solution, but here is a bash script to put in `bin/` that does the job :

``` bash bin/setup_permissions.sh
#!/bin/sh

DIR="$( cd "$( dirname "$0" )" && pwd )"
cd $DIR   # bin/, sibling of app/
cd ..     # project root

sudo setfacl -R -m u:www-data:rwx -m u:`whoami`:rwx app/cache app/logs
sudo setfacl -dR -m u:www-data:rwx -m u:`whoami`:rwx app/cache app/logs
sudo setfacl -R -m u:www-data:rwx -m u:`whoami`:rwx web
sudo setfacl -dR -m u:www-data:rwx -m u:`whoami`:rwx web
```