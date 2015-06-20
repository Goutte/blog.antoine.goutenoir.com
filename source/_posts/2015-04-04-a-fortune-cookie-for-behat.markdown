---
layout: post
title: "A fortune cookie for behat"
comments: true
published: true
categories:
  - PHP
  - BDD

---


{% blockquote fortune %}
A lost ounce of gold may be found,
a lost moment of time never.
{% endblockquote %}

When you run `bin/behat` and everything is green, you only get the warm fuzzy feeling of a work well done.
Why not reward yourself a bit more ?

Some show Chuck Norris giving the thumbs-up.

Some show half-naked pin-ups.

Most don't show anything special.

Enters the `fortune` cookie.

{% blockquote fortune %}
To be sure of hitting the target, shoot first
and, whatever you hit, call it the target.
{% endblockquote %}

Add this method to your `FeatureContext` class:

``` php
/**
  * @AfterSuite
  */
public static function afterTheSuite(AfterSuiteScope $scope)
{
    // Let's make a meme : a fortune cookie each time the suite runs okay
    if ($scope->getTestResult()->isPassed()) {
	try { print(shell_exec('fortune -a')); } catch (\Exception $e) {}
    }
}
```

Each time you'll run the feature suite and it passes, you'll be rewarded by
bits of wisdom/laughs/weirdness.

Of course, you need to install the `fortune` package on your system.

{% blockquote Douglas Adams, The Hichhikers Guide to the Galaxy %}
Flying is learning how to throw yourself at the ground and miss.
{% endblockquote %}

