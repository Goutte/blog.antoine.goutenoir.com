---
layout: post
title: "Tip ~ Check whether the current PHP file is included or executed"
date: 2010-10-28 10:28
comments: true
categories:
- PHP
- Code
- Tips

---

Let’s say you got a php file you want to behave differently if it is included ;
in my case I wanted it to only define the functions and classes it used and skip the output part.

``` php
<?php

/**
 * Returns true if current file is included
 */
function isIncluded() {
    $f = get_included_files();
    return $f[0] != __FILE__;
}

if ( !isIncluded() ) {
    // Do some stuff, eg: print some HTML
} else {
    // Do other stuff, 'cause you're included
}

// You can also use (recommended)
if ( __FILE__ != $_SERVER['SCRIPT_FILENAME'] ) {
    // this file is being included
}

```

The interesting function used here is [`get_included_files()`](http://www.php.net/manual/en/function.get-included-files.php).
