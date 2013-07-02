---
layout: post
title: "Ægo ~ Gherkin features for a Go game"
comments: true
categories:
- PHP
- TDD

---

Here's how you might write the game rules features of a go game on a quadsphere :

{% include_code Rejecting illegal moves lang:gherkin go_game_rules.feature %}

Of course, these are far from exhaustive, as they cover only suicide and ko scenarios.

Adding capture features allow us to cover a bit more code :

{% include_code Capture lang:gherkin go_game_capture.feature %}

Both these features were quite easy to implement, as unit-testing my classes made me craft all the tools I needed for Behat's `FeatureContext`.

On a side note, PHP 5.4's Traits do work quite nicely with `FeatureContext`.
