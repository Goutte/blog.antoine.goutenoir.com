---
layout: post
title: "PHP ~ Rooted Tree Node Serialization"
date: 2012-12-15 12:20
comments: true
categories:
- PHP
- Code
- Debian
- Ubuntu
- Linux
- Tips

---

**UPDATE** :
That was before I found out about SPL's [Recursive Tree Iterator](http://www.php.net/manual/en/class.recursivetreeiterator.php).
Well, live and learn !

---


I wrote a Symfony2 bundle providing tools for easy (de)serialization of rooted trees structures
where nodes hold a string value, and some methods for tree handling.

Using this, I can easily generate random trees like :

```
A
+--B
|  +--C
|  |  +--D
|  |     +--E
|  |     |  +--H
|  |     |  +--I
|  |     +--R
|  |     +--T
|  +--F
|  |  +--J
|  |  |  +--M
|  |  |  |  +--N
|  |  |  |  |  +--P
|  |  |  |  +--Q
|  |  |  |  +--U
|  |  |  |     +--V
|  |  |  +--Y
|  |  +--L
|  |     +--O
|  |        +--X
|  |        +--Z
|  +--G
|     +--W
+--K
   +--S
```


It is extensively tested but it has a small learning curve, if you’re new to Symfony.

<!--more-->

But in the end, the usage is as simple as :

``` php
<?php
$container->get('goutte_tree')
          ->useDriver('ascii')
          ->toString($myRootNode);
```


{% pullquote %}
The bundle also provides a lot of [useful methods for nodes](https://github.com/Goutte/TreeBundle/blob/master/Is/Node.php).
The exact behavior of each of these methods is described at length
[in the tests](https://github.com/Goutte/TreeBundle/blob/master/Tests/Model/NodeTest.php).

There are currently three drivers available : {" Parenthesis, Timbre, ASCII "}.
Writing this library was not much of a challenge,
but extending/refactoring it to _provide a generic toolset for Graph Theory_ proves to be one.
I created a work-in-progress `traits` branch, feel free to dig in and share your thoughts !
{% endpullquote %}
