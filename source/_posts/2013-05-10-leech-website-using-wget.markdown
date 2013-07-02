---
layout: post
title: "Leech a website using wget"
comments: true
categories:
- Linux
- Tips

---

Want to download a website for offline reading ?

Use `wget`, it's awesomely simple and powerful.


``` bash

$ wget -km http://antoine.goutenoir.com/blog

```

`-m` makes it recursive and thorough ; mirror-like, the doc says.

`-k` rewrites links to keep stylesheets and javascript working.


