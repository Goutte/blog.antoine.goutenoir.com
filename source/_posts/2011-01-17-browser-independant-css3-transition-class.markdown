---
layout: post
title: "Browser-Independant CSS3 Transition Classes"
date: 2011-01-17 17:01
comments: true
categories:
- CSS
- LESS
- Code
- Tips

---

When you’re building a full-featured website with HTML5 and CSS3,
you start to see the problem with having so many different browsers with so many different property naming conventions.
Factorization becomes mandatory, so you ~~might~~ should add somewhere in your main css file the following, or your custom implementation of it.

``` css
.smooth {
  -webkit-transition: all 0.5s ease-in-out;
  -khtml-transition:  all 0.5s ease-in-out;
  -moz-transition:    all 0.5s ease-in-out;
  -o-transition:      all 0.5s ease-in-out;
  transition:         all 0.5s ease-in-out;
}
```

Then, you’ll just have to add the smooth class to your DOM element,
and for example any property you put in the `:hover` CSS definition for this element will transition smoothly !

``` html
<div class="smooth"></div>
```

<!--more-->

I use many pre-defined transition classes such as :

``` css
.slick {
  -webkit-transition: all 0.3s ease-out;
  -khtml-transition:  all 0.3s ease-out;
  -moz-transition:    all 0.3s ease-out;
  -o-transition:      all 0.3s ease-out;
  transition:         all 0.3s ease-out;
}
```

or

``` css
.slow {
  -webkit-transition: all 1.8s cubic-bezier(0.1,0.5,0,0.9);
  -khtml-transition:  all 1.8s cubic-bezier(0.1,0.5,0,0.9);
  -moz-transition:    all 1.8s cubic-bezier(0.1,0.5,0,0.9);
  -o-transition:      all 1.8s cubic-bezier(0.1,0.5,0,0.9);
  transition:         all 1.8s cubic-bezier(0.1,0.5,0,0.9);
}
```


---

I recommend looking at [Animate.css](http://daneden.me/animate/).


## Wait ! There's MORE !

Actually, **Less is More**. The following are mixins you can use in your Less stylesheets :

``` css
.smooth (@duration: 1s) {
  -webkit-transition: all @duration ease-in-out;
  -khtml-transition:  all @duration ease-in-out;
  -moz-transition:    all @duration ease-in-out;
  -o-transition:      all @duration ease-in-out;
  transition:         all @duration ease-in-out;
}

.smoothHeight (@duration: 1s) {
  -webkit-transition: height @duration ease-in-out;
  -khtml-transition:  height @duration ease-in-out;
  -moz-transition:    height @duration ease-in-out;
  -o-transition:      height @duration ease-in-out;
  transition:         height @duration ease-in-out;
}

.smoothOpacity (@duration: 1s) {
  -webkit-transition: opacity @duration ease-in-out;
  -khtml-transition:  opacity @duration ease-in-out;
  -moz-transition:    opacity @duration ease-in-out;
  -o-transition:      opacity @duration ease-in-out;
  transition:         opacity @duration ease-in-out;
}

.smoothBGColor (@duration: 2s) {
  -webkit-transition: background-color @duration ease-in-out;
  -khtml-transition:  background-color @duration ease-in-out;
  -moz-transition:    background-color @duration ease-in-out;
  -o-transition:      background-color @duration ease-in-out;
  transition:         background-color @duration ease-in-out;
}

.rotation (@deg: 5deg){
  -o-transform: rotate(@deg);
  -webkit-transform: rotate(@deg);
  -moz-transform: rotate(@deg);
  -ms-transform: rotate(@deg);
  transform: rotate(@deg);
}

.opacity (@opacity: 0.5) {
  -moz-opacity:    @opacity;
  -khtml-opacity:  @opacity;
  -webkit-opacity: @opacity;
  opacity:         @opacity;
}
```

