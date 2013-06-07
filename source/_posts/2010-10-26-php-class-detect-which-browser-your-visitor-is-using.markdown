---
layout: post
title: "PHP Class ~ Detect which Browser your visitor is using"
date: 2010-10-26 10:26
comments: true
categories:
- PHP
- Code

---

You can use this very simple static class to detect which browser your visitor is using.
It uses `$_SERVER['HTTP_USER_AGENT']`, with all its drawbacks.
It’s quite useful for styling, if you want to add a CSS file only for a certain browser, such as, for example :

``` php Example of use

<?php if ( Browser::isIE() ): ?>
    <link rel="stylesheet" href="style/css/ie.css" />
<?php endif; ?>

<?php if ( Browser::isIE6() ): ?>
    <link rel="stylesheet" href="style/css/ie6.css" />
<?php endif; ?>

<?php if ( Browser::isAndroid() ): ?>
    <link rel="stylesheet" href="style/css/android.css" />
<?php endif; ?>

<?php if ( Browser::isIpad() || Browser::isIphone() ): ?>
    <link rel="stylesheet" href="style/css/apple_mobile.css" />
<?php endif; ?>

```


You can detect IE6, IE7, IE8, IE9, Chrome, Firefox, Opera, Safari, the iPhone, the iPad, and Android.

<!--more-->

Here's the class :

{% include_code Simple static methods to detect User Agent Browser.php %}

Of course, I recommend using the native `get_browser()` PHP function when you can,
which uses the exhaustive [browscap](http://www.php.net/manual/en/function.get-browser.php).
