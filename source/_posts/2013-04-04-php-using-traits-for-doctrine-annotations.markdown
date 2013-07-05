---
layout: post
title: "PHP ~ Using Traits for Doctrine ODM or ORM Annotations"
comments: true
categories:
- PHP
- Tips

---

{%comment%}
*[ODM]: Object Document Manager
*[ORM]: Object Relational Manager
{%endcomment%}

Say you want to reuse document properties through multiple documents.
You can use PHP 5.4 Traits to both implement interfaces _and_ define Doctrine's annotations.
I use an <abbr title="Object Document Manager">ODM</abbr> in this post,
but it should hold true for <abbr title="Object Relational Manager">ORM</abbr>s as well.

Say you have the interface `Identifiable`,

``` php Identifiable interface
<?php

namespace MyVendor\MyBundle\Is;

interface Identifiable
{
    public function getId();
    public function setId($id);
}

```

... which you want to implement using the Trait `IdAsParameter` :


``` php IdAsParameter trait
<?php

namespace MyVendor\MyBundle\Has;

/**
 * Bare-bones (but strict) way of having an id as parameter,
 * and providing Doctrine with necessary annotations
 */
trait IdAsParameter // implements Identifiable
{

    /**
     * @ODM\Id
     */
    protected $id;

    public function getId()
    {
        if (null === $this->id) {
            throw new \BadMethodCallException("Entity has no ID yet, persist it first.");
        }

        return $this->id;
    }

    public function setId($id)
    {
        $this->id = $id;
    }
}

```

Note the absence of any `use` statement regarding the ODM in the trait.

Doctrine will use the `ODM` namespace **defined in your class** :

``` php MyDocument, your persistable POPO
<?php

namespace MyVendor\MyBundle\Document;

use Doctrine\ODM\MongoDB\Mapping\Annotations as ODM; // here

/**
 * @ODM\Document
 */
class MyDocument implements Identifiable
{
    use \MyVendor\MyBundle\Has\IdAsParameter;

    // ...
}

```

Now, you're ready to persist `MyDocument` in your manager.

Using this behavior, you can make traits holding both the properties and their annotations.
*Reusability wins !*

-----

Protip : using Symfony2 DIC on the annotations reader, you can call the `DocParser` method
`setIgnoreNotImportedAnnotations` with `true` and make truly manager-agnostic traits,
providing both ODM and ORM annotations for example.


