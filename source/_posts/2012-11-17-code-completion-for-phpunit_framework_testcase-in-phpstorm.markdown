---
layout: post
title: "Code completion for PHPUnit_Framework_TestCase in PHPStorm"
date: 2012-11-17 11:17
comments: true
categories:
- PHP
- Code
- Tips

---

To allow PHPStorm to discover the PHPUnit classes,
go to `Settings > Project Settings > PHP`,
and add the path to PHPUnit, usually something like **`/usr/share/php/PHPUnit`**.

{% img center /images/posts/phpstorm_configure_php_include_path.png 'Screenshot of PHPStorm configuration of PHPUnit Code Completion' %}

Now you do not have an excuse not to test your Symfony2 bundles !