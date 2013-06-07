---
layout: post
title: "MySQL ~ Command-line import big database"
date: 2008-12-12 12:21
comments: false
categories:
- Snippet
- SQL
- Tips

---

Assuming `MyFile.sql` is an SQL file containing an export of one database :

<big>
`cat MyFile.sql | mysql -u MyUser -p'MyPassword' MyDatabase`
</big>

Notes :

  - there is no space between the -p option and the password.
  - the password is raw in the command-line = **VERY BAD** practice !
  - you should never [copy-paste command-lines](http://thejh.net/misc/website-terminal-copy-paste) from websites.