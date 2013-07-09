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


