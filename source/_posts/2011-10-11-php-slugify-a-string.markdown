---
layout: post
title: "PHP ~ Slugify a String With or Without Iconv"
date: 2011-10-11 11:01
comments: true
categories:
- PHP
- Code

---

While playing with Symfony (with Doctrine), I tweaked some of their built-in functions that I found useful.
Slugifying a string for instance, for when you want pretty URIs...


## Without iconv

What if my server has not iconv ?

Here is how to quickly slugify a string without iconv.
Try the following function, which covers less use-cases, but enough sometimes.


``` php Slugify an UTF-8 string using vanilla PHP
<?php
/**
 * Returns the slugified (aka urlized) $string,
 * which will match \a-z0-9-\
 * Some special chars are
 *
 * "Ça alors, déjà !?" => "ca-alors-deja"
 *               "Œuf" => "uf"   :(
 *          "~&a; -b?" => "a-b"
 *             "! ? #" => "n-a"
 *
 * Notes :
 * - $string must be UTF-8
 * - æœÆŒ not covered !
 *
 * @param  string $s The utf8 string to slugify
 * @return string    The slugified string
 */
function utf8_slugify ($s) {
  $s = utf8_decode($s);
  $s = html_entity_decode($s);
  
  // list is not extensive -- suggestions are welcome !
  $b = 'ÀÁÂÃÄÅàáâãäåÇçÈÉÊËèéêëÌÍÎÏìíîïÑñÒÓÔÕÖØòóôõöøÙÚÛÜùúûüÿ';
  $a = 'AAAAAAaaaaaaCcEEEEeeeeIIIIiiiiNnOOOOOOooooooUUUUuuuuy';
  $s = strtr($s, utf8_decode($b), $a);
  $s = trim($s); // trim white whars
  
  // remove unwanted chars
  $s = preg_replace('/([^a-z0-9]+)/i', '-', $s);
  $s = strtolower($s);
  
  // remove `-` duplicates
  $s = preg_replace('/--+/', '-', $s);
  $s = trim($s, '-'); // trim `-`

  if (empty($s)) return 'n-a';

  return utf8_encode($s);
}
```

This is a hack as-is, neither maintained nor properly unit tested.
Nowadays, I recommend using _Inflectors_ instead of this function.

<!--more-->

## Using iconv

``` php Slugify a string using PHP and iconv
<?php
/**
 * Returns the slugified (aka urlized) $string
 * 
 * Notes: Uses iconv
 *
 * @param  string $string The string to slugify
 * @return string         The slugified string
 */
function slugify_with_iconv ($string)
{
  // replace non letter or digits by -
  $string = preg_replace('~[^\pLd]+~u', '-', $string);
  $string = trim($string, '-'); // trim `-`

  // transliterate
  if (function_exists('iconv')) {
    $string = iconv('utf-8', 'us-ascii//TRANSLIT', $string);
  } else {
    thow new Exception('iconv is not available.');
  }

  // remove unwanted chars
  $string = strtolower($string);
  $string = preg_replace('~[^-w]+~', '', $string);

  if (empty($string)) return 'n-a';

  return $string;
}
```

---

_This has Not (been) Invented Here (mostly), and the proper keyword you should be looking for is **Inflector**._

Specifically, look at `urlize` from [Doctrine 1′s Inflector](https://github.com/doctrine/doctrine1/blob/master/lib/Doctrine/Inflector.php).