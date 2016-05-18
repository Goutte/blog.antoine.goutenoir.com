---
layout: post
title: "A sparse vector in python"
comments: true
published: true
categories:
  - Python

---

Ever needed a sparse vector in python ?

scipy.sparse
------------

You _could_ use the 2D matrices in `scipy.sparse`, like :

``` python
from scipy.sparse import lil_matrix
m = lil_matrix((1, 10000))
```

But there's a bunch of issues with that :

1. The default value must be 0.
2. Confusing and verbose API for 1D data.

Look at the following :

``` python
m
# <1x1000 sparse matrix of type '<type 'numpy.float64'>'
#         with 1 stored elements in LInked List format>

m[0]
# <1x1000 sparse matrix of type '<type 'numpy.float64'>'
#         with 1 stored elements in LInked List format>
# ... still a 2D matrix !

# And if I want the nth element, I have to provide both indices :
m[0, n]
```

Not very convenient.

sparse_vector
-------------

Enters [`sparse_vector`](https://pypi.python.org/pypi/sparse_vector).

It's usually faster than its parent [`sparse_list`](https://pypi.python.org/pypi/sparse_list), because we can assume that the values are numerical.

``` python
from sparse_vector import SparseVector
sv = SparseVector(1e7, default_value=42, dtype=int)
sv[1337] == 42  # True
sv[1337] = 23
sv[1337] == 42  # False
sv[1337] == 23  # True
```

Look at the [benchmark](https://github.com/Goutte/python_sparse_vector/blob/master/benchmark_sparse_vector.py) results :


```
Benchmark Report
================

BenchmarkDensify
----------------

                       name | rank | runs |     mean |       sd | timesBaseline
----------------------------|------|------|----------|----------|--------------
vector densify with densify |    1 |    3 | 0.002247 | 0.000462 |           1.0
   vector densify with list |    2 |    3 |   0.1383 | 0.002304 | 61.5717924228
  vector densify with numpy |    3 |    3 |   0.4972 | 0.005558 | 221.324949591
     list densify with list |    4 |    3 |    3.727 | 0.009633 | 1659.02462061

BenchmarkGet
------------

                             name | rank | runs |    mean |        sd | timesBaseline
----------------------------------|------|------|---------|-----------|--------------
  list get with iterable in slice |    1 |    3 | 0.03564 | 0.0001119 |           1.0
vector get with iterable in slice |    2 |    3 |  0.2378 |   0.00134 | 6.67255214546

BenchmarkInit
-------------

                   name | rank | runs |      mean |        sd | timesBaseline
------------------------|------|------|-----------|-----------|--------------
              list init |    1 |    3 | 3.656e-06 | 1.587e-06 |           1.0
            vector init |    2 |    3 | 3.163e-05 | 1.708e-05 | 8.65217391304
vector init with values |    3 |    3 | 7.494e-05 | 3.744e-05 |          20.5
  list init with values |    4 |    3 |  0.007989 |  9.41e-05 | 2185.32608696

BenchmarkIterate
----------------

                    name | rank | runs |   mean |        sd | timesBaseline
-------------------------|------|------|--------|-----------|--------------
          vector iterate |    1 |    3 | 0.1187 | 0.0009074 |           1.0
            list iterate |    2 |    3 |  3.805 |   0.01608 | 32.0599268667
vector iterate not dense |    3 |    3 |  21.15 |    0.0679 | 178.218208736

BenchmarkSet
------------

                                      name | rank | runs |     mean |        sd | timesBaseline
-------------------------------------------|------|------|----------|-----------|--------------
vector set with iterables in slice present |    1 |    3 | 0.004119 | 3.513e-05 |           1.0
   list set with iterables in slice absent |    2 |    3 |  0.00835 |  0.000506 | 2.02712557637
  list set with iterables in slice present |    3 |    3 |  0.01047 |  0.001076 | 2.54289738198
 vector set with iterables in slice absent |    4 |    3 |  0.01212 | 0.0001616 | 2.94127293423

```