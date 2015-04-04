---
layout: post
title: "Dart ~ An iterator for map values"
comments: true
published: true
categories:
- Dart
---


## A convoluted way

I did not find this on the Internet, so here it is :

``` dart
/// A simple iterator on the values of a Map.
class MapValuesIterator implements Iterator {
  Map map;
  Iterator iterator;
  MapValuesIterator(Map this.map) {
    iterator = map.keys.iterator;
  }

  get current => map[iterator.current];
  bool moveNext() {
    return iterator.moveNext();
  }
}
```

Pretty useful when you have class wrapping a Map, like this :

``` dart
class MyIterableClass extends IterableBase {

  Map myInternalMap;

  get iterator => new MapValuesIterator(myInternalMap);

  // ...

}
```

## A better way

Of course, you can simply do :

``` dart
class MyIterableClass extends IterableBase {

  Map myInternalMap;

  get iterator => myInternalMap.values.iterator;

  // ...

}
```

Which is better. Much better.



