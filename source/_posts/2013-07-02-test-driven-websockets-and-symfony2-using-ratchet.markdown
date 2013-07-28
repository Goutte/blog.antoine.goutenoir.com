---
layout: post
title: "PHP ~ Test-Driven HTML5 Websockets and Symfony2 using Ratchet"
comments: true
categories:
- PHP

published: false
---

In order to make a smooth game experience for players of [Cyx] and Ægo,
I needed my application to support HTML5's [Websockets](http://www.html5rocks.com/en/tutorials/websockets/basics/).

The easy way to achieve this is using the Node.js framework Sails.js, but I'd never done Websockets in PHP and I was curious.
I'll move eventually to Scala (as lichess did), or [Go] (_because it looks awesome and it would be sooo meta_), but it's not the subject.

Ratchet
-------

I tried the excellent Ratchet to achieve my goal in PHP. It integrates quite nicely with Symfony2, as it uses Composer and POPO. (Plain Old PHP Objects)

I'm not going to describe here how to setup Ratchet, as it's covered in [its documentation](http://socketo.me/docs).

Ratchet looks perfect for a small server, but it needs testing for production-grade usage.



Test your App
-------------

Testing is another matter, though.

I found and hacked around a small PHP Websocket client class supporting Hybi10.




TODO



---

[Cyx]: http://antoine.goutenoir.com/games/cyx
[Go]: http://golang.org