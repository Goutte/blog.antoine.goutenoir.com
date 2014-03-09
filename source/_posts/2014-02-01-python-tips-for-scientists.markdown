---
layout: post
title: "Python tips for scientists"
comments: true
published: true
categories:
- Python
---

## Zen of Python

Just type :

``` python
import this
```

in ipython, or any other python console.


## Idioms

### == vs is

When comparing with `None`, you should always use `is` instead of `==`.
It's a tad faster and it's more idiomatic.

Replace `if my_data != None:` by `if my_data is not None:`.

When comparing with other things, `is` will compare **pointers** (True only if they are the same object in memory) and `==` will compare **values** (can be different objects in memory, as long as their values are the same).

Simply put :
  - `is` is an _identity_ comparator.
  - `==` is an _equality_ comparator.

Most of the time (including with string and integers), you want to use `==` instead of `is`, unless you're comparing with `None`.

Just look at the following pitfalls :

``` python

## INTEGERS

3.0 == 3.0  # True
3.0 is 3.0  # True  (so far so good)
3.0 == 3    # True
3.0 is 3    # False (float is not int)

import numpy
a = numpy.float(3.0)

a == 3.0    # True
a is 3.0    # False (danger zone)

## STRINGS

a = 'irap'
b = 'irap'
c = ''.join(['i', 'r', 'a', 'p'])

a == b  # True
a == c  # True
a is b  # True (because of python internal optimizations)
a is c  # False /!\

## THINGS

numpy.nan == numpy.nan  # False /!\
numpy.nan is numpy.nan  # True

numpy.inf == numpy.inf  # True
numpy.inf is numpy.inf  # True

```




## from __future__ import ...

This directive is used to _import awesomeness_ that is not available in the version of python you're currently using,
but has been added to more recent versions of python. A good example of this is the _division_ module, as seen below.

``` python
# sys.version < '3.*.*'

1 / 2.0    # => 0.5
1 / 2      # => 0
```

``` python
from __future__ import division

1 / 2   # => 0.5
1 // 2  # => 0
```

The modern python always returns the expected result on a regular `/` division,
and you can still explicitly use `//` for euclidian division.

{% blockquote %}
Explicit is better than implicit.
{% endblockquote %}

