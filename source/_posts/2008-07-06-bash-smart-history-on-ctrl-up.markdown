---
layout: post
title: "Bash smart history on UP"
comments: true
categories:
- Linux
- Tips

---

You can either edit your `~/.bashrc` :

``` bash ~/.bashrc
if [[ $- == *i* ]]
then
    bind '"\e[A": history-search-backward'
    bind '"\e[B": history-search-forward'
fi
```

or create a `~/.inputrc` file :

``` bash ~/.inputrc
"\e[A": history-search-backward
"\e[B": history-search-forward
```

Launch a new terminal, start typing, hit <big>`↑`</big>, and enjoy !

This is the kind of shortcut whose existence you forget about and are painfully reminded of when you use someone else's terminal !


