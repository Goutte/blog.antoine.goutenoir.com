---
layout: post
title: "phpMyAdmin ~ Name snippet for database export"
date: 2009-06-18 18:06
comments: false
categories:
- Snippet
- SQL
- Tips

---

When you export a database, its name is formatted using `strftime`.
Use the following to get a filename with the current date :

<big>
**`__DB___%Y-%m-%d`**
</big>