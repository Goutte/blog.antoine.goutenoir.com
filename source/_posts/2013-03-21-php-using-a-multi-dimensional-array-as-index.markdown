---
layout: post
title: "PHP ~ Using a multi-dimensional array as index"
comments: true
categories:
- PHP
- Code
---

Say you want to use a multidimensional array as a multiple-keyed index.

Here is a small collection of functions to handle indexing operations on multidimensional arrays.


Getting a value
---------------

``` php Usage example of index_get()
<?php

// fails when one of the keys does not exist
$value = $index[$ka][$kb][$kc][$kd];

// returns null when one of the keys does not exist
index_get($index, array($ka, $kb, $kc, $kd));

```

And below is a simple _(but tested)_ function safely getting a value from a multidimensional array :


``` php Get value at specified keys in multidimensional array
<?php

/**
 * Gets value in the multidimensional array, at the specified $keys.
 * Returns null when not found.
 *
 * Eg:
 * using $keys = array('a','b','c')
 * is equivalent to $array['a']['b']['c']
 *
 * @param  array             $array
 * @param  array|ArrayObject $keys
 * @return mixed|null
 */
function index_get (&$array, $keys)
{
    $keys = (array) $keys;
    for ($i =& $array; null !== $key = array_shift($keys); $i =& $i[$key]) {
        if (!isset($i[$key])) return null;
    }

    return $i;
}
```


Setting a value
---------------

``` php
<?php

// fails if index is not already populated with arrays
$index[$ka][$kb][$kc][$kd] = $value;`

// will create "intermediate" arrays
index_set($index, array($ka, $kb, $kc, $kd), $value);

```

Below is a simple _(but tested)_ function safely setting a value in a multidimensional array :

``` php Set value at specified keys in multidimensional array
<?php

/**
 * Mutates $value in the multidimensional array, at the specified $keys.
 * Creates subarrays if needed.
 *
 * Eg:
 * using $keys = array('a','b','c')
 * is equivalent to $array['a']['b']['c'] = $value
 *
 * @param array             $array
 * @param array|ArrayObject $keys
 * @param mixed             $value
 */
function index_set (&$array, $keys, $value)
{
    $keys = (array) $keys;
    for ($i =& $array; null !== $key = array_shift($keys); $i =& $i[$key]) {
        if (!isset($i[$key])) $i[$key] = array();
    }
    $i = $value;
}
```

Removing a value
----------------

This is not like setting the value to null ; it removes the value and all empty arrays along the path.

``` php Remove value at specified keys in multidimensional array
<?php

/**
 * Cleanly removes a value from the multidimensional array,
 * removing subarrays when they're empty.
 * It always leaves the root array.
 *
 * @param array $array
 * @param array|ArrayObject $keys
 * @param bool $_check Internal value used by recursion.
 *                     If this is false and there are arrays missing
 *                     along the "path" made by $keys, your world will burn.
 *
 */
function index_remove (&$array, $keys, $_check=true)
{
    $keys = (array) $keys;

    if ($_check) {
        $keys2 = $keys; // copy
        for ($i =& $array; null !== $key = array_shift($keys2); $i =& $i[$key]) {
            if (!isset($i[$key])) return;
        }
    }

    if (0 == count($keys)) {
        return;
    } else if (1 == count($keys)) {
        unset($array[array_shift($keys)]);
    } else {
        $key = array_shift($keys);
        index_remove($array[$key], $keys, false);
        if (empty($array[$key])) unset($array[$key]);
    }

}
```

Some tests :

``` php
<?php

$ma = array(
    'a'=>array(
        0 => 10,
        1 => 11,
    ),
    'b'=>array(
        'c' => 42,
    ),
);


index_remove($ma, array('b','c'));

assertNull(index_get($ma, array('b','c')), "Remove value");
assertCount(1, $ma, "Remove empty array(s)");

index_remove($ma, array('a',0));
index_remove($ma, array('a',1));

assertEquals(array(), $ma, "Always leave the root array");

index_remove($ma, array('?','¿'));
assertEquals(array(), $ma, "Silently ignore not found");
// should it ? or should it throw like a greek discobole ?


```


---

I dabbled a bit with the OO approach of this, too.
It needs more research, and I like the functional programming approach.

