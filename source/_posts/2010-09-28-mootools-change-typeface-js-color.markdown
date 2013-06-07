---
layout: post
title: "Mootools ~ Change typeface-js color after initialization"
date: 2010-09-28 09:28
comments: true
categories:
- Code
- Javascript
- Mootools

---

[Typeface-js](http://typeface.neocracy.org/) is a useful javascript-based font renderer, but there is no method for changing the color of a typefaced element once it has been processed.
So, here is one way to change the color on-the-fly with mootools. Be warned : it may be buggy.

``` javascript Method to change the color of a typefaced element
Element.implement ({

  /**
   * Change Typefaced Element color
   * @param string color eg: #FF3399
   */
  changeTypefaceColor: function(color){
    if (Browser.Engine.trident) { // IE SHIT
      this.getFirst('span').getChildren().each(function(vectorElement){
        vectorElement.fillColor = color;
      });
    } else { // OTHERS
      this.getFirst('span').getChildren().each(function(vectorElement){
        if (vectorElement.getContext) {
          var ctx = vectorElement.getContext('2d');
          if (ctx.fillStyle.toUpperCase() != color) {
            ctx.fillStyle = color;
            ctx.clearRect(0, 0, 1000, 1000);
            ctx.fill();
          }
        }
      });
    }
  }

});
```

Include the above in your library, and then use it as follows :

``` javascript Usage example of changeTypefaceColor
// ASSUMING YOU GOT AN ELEMENT WITH id="mytitle"
document.id('mytitle').addEvent ('mouseenter', function(){
  document.id('mytitle').changeTypefaceColor ('#FF3399');
});
document.id('mytitle').addEvent ('mouseleave', function(){
  document.id('mytitle').changeTypefaceColor ('#3399FF');
});
```

Also, remember : **DON'T USE TYPEFACE** if you can avoid it.
IE is a thing of the past ; best left slumbering.
Not unlike raptors.
