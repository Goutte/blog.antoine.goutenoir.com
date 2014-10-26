---
layout: post
title: "Notes about Dartlang"
comments: true
published: true
categories:
- Dart
---

These are opinionated notes. You are forbidden to read them. Trespassers will be shouted at.

## The good

- Not javascript
- Fast and efficient development cycle (bugs get squashed quickly)
- Clever and pleasing function docstrings
- Growing [TDD](https://pub.dartlang.org/search?q=unit+test) and [BDD](https://pub.dartlang.org/search?q=BDD) runners
- IDE rainbows due to (optional) typing
- Not javascript (I cannot stress this enough)

## The bad

### Throw & Catch vs Raise & Solve

Take a tour of [the dart specs](https://www.dartlang.org/docs/spec/latest/dart-language-specification.html).

You'll find this smelly tidbit :

```
The throw expression is used to raise an exception.
```

At the time of this note, the above specs mention `throw` 60 times and `raise` 17 times.
Why ? Because in everyday life exceptions (aka. problems, issues) *are not thrown*, they *arise*, and it's hard to shake off natural speech.

We should leverage the analogy, not hide it behind elitist lingo that confuses the neophyte and hogs up brain disk space for no gain but the buzz of feeling superior.

I'm taking a pedagogic stance here.

The **raise** expression is used to **raise** a problem. (duh)

I don't care if almost every known language and their mamas use `throw`, especially javascript that dart aims to put in a museum where it belongs.
Any new language should seriously consider *any* expression they implement, and the Darties did such a good job with their classes and overall semantics
that it's amazing nobody paused for a second before throwing us idiosyncratically over the crevasse of language discrepancy.

There must have been someone in the Dart team that was conscious of this issue, because they felt the need to clarify :

```
Whenever we say that an exception ex is raised or thrown,
we mean that a throw expression of the form: throw ex; was implicitly evaluated [...]
```

But, you'll say, what about the beautiful symmetry of throwing and catching ? Son and father on the fresh-mown lawn ?
**Raising** and **catching** is not as sexy, and as of now each time you'll use them in Python you'll think of **zombie pokemons**!

{% img center /images/posts/notes-about-dartlang/zombie_pokemons.jpg "Raise'em all, catch'em all -- [stolen image]" "Raise'em all, catch'em all" %}

_Catch_ has got to go too, then ! Python dared not go there, but we will !

What about **raising** and **solving** ? (Code-bred obsessive-compulsives will like keeping the character length equality, I know I do)
That would even be more elegant if **Exceptions were Problems**, which they are, from the raiser point of view.
_Error_ is fine too, you can raise it and solve it. Let's save _issue_ for the bugtracker.


``` python Idiomatic python to the marrow
try {
  i.drink(milk)
} solve (SouredMilk problem) {
  i.spit()
  i.makeCheese(milk)
}
```

{% blockquote %}
Try this, and if a problem arises, you can solve it !
{% endblockquote %}

#### Exceptions are not bugs

Just for fun, what if Exceptions were Bugs ?

- hatch & catch
- buzz & swat
- infest & squash

The first one is pretty easy to remember, no ?
Too bad the word _bug_ conveys the idea that the event has not been predicted by the programmer(s).

While we're here, I might as well copy-paste those witty bug species found on ze internet :

* _Bohrbugs_: Most of the bugs that we come across are reproducible, and are known as Bohrbugs.
* _Heisenbugs_: All experienced programmers have faced situations where the bug that crashed the software just disappears when the software is restarted.
* _Mandelbugs_: When the cause of the bug is too complex to understand, and the resulting bug appears chaotic.
* _Schroedinbug_: Sometimes, you look into the code, and find that it has a bug or a problem that should never have allowed it to work in the first place.


### CoffeeDart

What Coffeescript has to offer to dart is pretty addictive :

- Whitespaces
- No trailing `;`

I remember thinking as a child learning BASIC that these trailing semicolons were redundant, and that they would disappear sooner or later.
I'm confident that some day we'll see those sweet features in dart, even if it means (gasp!) transpiling to dart.



---

Dart is pretty awesome, in the end. (anything beats javascript, anyways)





