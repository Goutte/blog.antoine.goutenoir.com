---
layout: post
title: "Setup (for good) Symfony2 cache and logs permissions with setfacl"
date: 2008-10-11 10:11
comments: true
categories:
- Linux
- Tips
- Snippet

---

`chmod` is not enough, sometimes.
Therefore, we need to adapt our access control lust <small>(see what I did there ?)</small> for our `www-data` user.

This may or may not be the best solution, but it works :

```
sudo setfacl -R -m u:www-data:rwx -m u:`whoami`:rwx app/cache app/logs
sudo setfacl -dR -m u:www-data:rwx -m u:`whoami`:rwx app/cache app/logs
sudo setfacl -R -m u:www-data:rwx -m u:`whoami`:rwx web
sudo setfacl -dR -m u:www-data:rwx -m u:`whoami`:rwx web
```