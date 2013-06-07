---
layout: post
title: "Use symfony2 console with LAMPP without installing the php package under Ubuntu or Debian"
date: 2011-02-12 12:20
comments: true
categories:
- PHP
- Code
- Debian
- Ubuntu
- Linux
- Tips

---

{% pullquote %}
You do not want to install the `php5-cli` package, maybe there isn’t a proper version in your repositories yet,
maybe you think LAMPP (v1.7.4 and above have php-5.3.5) should be enough, whatever. No worries.

You just need to know where you installed LAMPP (usually `/opt/lampp/`), a text file editor,
and you’ll be playing with your brand-new symfony2 installation in no time !
{" LAMPP is useful for beginners "}, but watch out for dragons !
{% endpullquote %}

Open the `console` (or `console_dev`) file, located in the symfony2 `app/` folder, and replace the first line,

```
#!/usr/bin/env php
```

by that one :

```
#!/opt/lampp/bin/php
```


Of course, if you installed LAMPP somewhere else, replace `/opt/lampp/` by your installation path.

After that, don't use `php app/console`, just `app/console`.
