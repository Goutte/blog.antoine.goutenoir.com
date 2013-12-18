---
layout: post
title: "Bash smart history on CTRL+UP"
comments: true
categories:
- Linux
- Tips

---


Create this file :

``` bash ~/.inputrc
"\e[1;5A": history-search-backward
"\e[1;5B": history-search-forward
```

Launch new terminal, start typing, hit <big>`ctrl`+`↑`</big>.
On some systems, I had to reboot, because sourcing the file was not enough. No idea as to why.


