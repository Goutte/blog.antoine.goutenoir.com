---
layout: post
title: "Install Symfony CMF on Debian Wheezy"
comments: true
categories:
- PHP
- Symfony
- Linux
- Debian

---

## Symfony CMF

Its awesomeness speaks for itself.

## Setup

### Problem

When composing, you get 
`the requested linked library icu has the wrong version installed or is missing from your system`.

### Solution

``` bash Install
$ sudo aptitude install php5-intl
```

## Usage

### Problem

When saving a modified page from the inline editor.
`General error: 14 unable to write to database file` or `General error: 14 unable to open database file`.

### Solution

`app/app.sqlite` must be writeable, and, weirdly, `app/` too.