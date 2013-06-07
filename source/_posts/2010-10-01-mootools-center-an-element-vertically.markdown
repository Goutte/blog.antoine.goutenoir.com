---
layout: post
title: "Mootools ~ Center an element vertically in its parent"
date: 2010-10-01 10:01
comments: true
categories:
- Code
- Javascript
- Mootools

---

This mootools implementation will center an element into its parent element,
which you can override by passing it as parameter.
Sometimes we just cannot do this in pure CSS, so...

``` javascript Method to center an element vertically in its parent
Element.implement ({

  /**
   * Centers vertically this Element in its parent element.
   * Makes this element absolute and its parent at least relative.
   * Might wreak havoc in the element's horizontal centering,
   * because the `left` property will be 0. (the default)
   *
   * @param  Element parent Optional. The parent element, defaults to the first parent.
   * @return Element This Element
   */
  centerVertically: function(parent){
    parent = document.id(parent); if (!parent) parent = this.getParent();
    var top = parent.getSize().y / 2 - this.getSize().y / 2;
    if (parent.getStyle('position') == 'static')
      parent.setStyle('position', 'relative');
    if (this.getStyle('position') == 'static')
      this.setStyle('position', 'absolute');
    this.setStyle('top', top.toInt());
    return this;
  }

});
```
