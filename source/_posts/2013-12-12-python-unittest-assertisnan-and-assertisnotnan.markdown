---
layout: post
title: "Python UnitTest : assertIsNan() and assertIsNotNan()"
comments: true
categories:
- Python
- UnitTesting

---

How do we assert that a value is `nan` (not a number) ?

We could do `self.assertTrue(math.isnan(value))`, but it will raise a `TypeError` if `value` is neither a `float` or a `Real`.

And when we want to assert that a value is not `nan` using `self.assertFalse(math.isnan(value))`, it is a problem.

It's an interesting question actually : does "not `nan`" needs to be a number or just not `nan` ? It's a matter of taste, I think.
The following could be improved with a `strict` parameter to accord to all tastes (right now, it's strict), but here it is :

``` python numeric_assertions.py
import math


class NumericAssertions:
    """
    This class is following the UnitTest naming conventions.
    It is meant to be used along with unittest.TestCase like so :
    class MyTestCase(unittest.TestCase, NumericAssertions):
        ...
    It needs python >= 2.6
    """

    def assertIsNan(self, value, msg=None):
        """
        Fail if provided value is not nan
        """
        standardMsg = "%s is not nan" % str(value)
        try:
            if not math.isnan(value):
                self.fail(self._formatMessage(msg, standardMsg))
        except:
            self.fail(self._formatMessage(msg, standardMsg))

    def assertIsNotNan(self, value, msg=None):
        """
        Fail if provided value is nan
        """
        standardMsg = "Provided value is nan"
        try:
            if math.isnan(value):
                self.fail(self._formatMessage(msg, standardMsg))
        except:
            pass
```

Then, you can simply use `self.assertIsNan()` and `self.assertIsNotNan()`.