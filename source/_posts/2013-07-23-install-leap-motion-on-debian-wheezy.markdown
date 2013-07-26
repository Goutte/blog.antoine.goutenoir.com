---
layout: post
title: "Install LEAP Motion on Debian Wheezy"
comments: true
categories:
- LEAP
- Linux

---

My #firstLEAP experience, despite being somewhat frustrating after a year and half
of increasingly feverish expectations, proved to me one simple point :
**I had to get this to work under Debian.**

WAIT, WHAT ?
------------

-You're going to install closed-source software on Debian !?

-Yes. Don't twist the knife, please.

---

THE PROCESS
-----------

Grab the [LEAP Linux SDK](https://developer.leapmotion.com/downloads), un-tar it, and try to install :

``` OH NOES
$ sudo dpkg -i Leap-0.8.0-x64.deb 
Sélection du paquet leap précédemment désélectionné.
(Lecture de la base de données... 146662 fichiers et répertoires déjà installés.)
Dépaquetage de leap (à partir de Leap-0.8.0-x64.deb) ...
dpkg: des problèmes de dépendances empêchent la configuration de leap :
 leap dépend de libc6 (>= 2.15-0) ; cependant :
  La version de libc6:amd64 sur le système est 2.13-38.

dpkg: erreur de traitement de leap (--install) :
 problèmes de dépendances - laissé non configuré
Des erreurs ont été rencontrées pendant l'exécution :
 leap
```

`libc6` is too ~~old~~ stable !

A backport of the `leap` package is not an option, as its source is closed and they [don't answer questions about open-sourcing](https://forums.leapmotion.com/showthread.php?527-Open-source-SDK-software).

No worries, `libc6` is available in version 2.17-7 in jessie[^1], so we're going to pin the hell out of it !

APT-PINNING
-----------

Append `testing` to your sources :

``` /etc/apt/sources.list
## testing          
deb http://ftp.debian.org/debian testing main contrib non-free
```

Give `testing` a priority of 300, which is more than installed packages (100) but less than stable (400) :

``` /etc/apt/preferences.d/testing (new file)
Package: *
Pin: release o=Debian,a=testing
Pin-Priority: 300
```

Now, we need to politely ask aptitude to resolve dependencies using `testing` :

```
$ sudo aptitude -f install
```

It will propose multiple solutions to resolve the dependencies.
Refuse them until it suggests installing `libc6` from `testing`.

Accepting this solution made it (on my machine) remove the following packages :

```
Les paquets suivants seront ENLEVÉS : 
  espeak-data{u} festival{u} festival-freebsoft-utils{u} festlex-cmu{u} festlex-poslex{u} festvox-kallpc16k{u} kaccessible{u} kde-icons-mono{u} kmag{u} kmousetool{u} kmouth{u} 
  libc6-dbg{a} libdotconf1.0{u} libespeak1{u} libestools2.1{u} libopencore-amrnb0{u} libopencore-amrwb0{u} libsonic0{u} libsox-fmt-alsa{u} libsox-fmt-base{u} libsox2{u} sound-icons{u} 
  sox{u} valgrind{a} valgrind-dbg{a} 
```

But then, victory was at hand !

```
Leap Motion daemon and applications installed under /usr/bin/
Allow Leap Motion in the system tray with the following command:
  gsettings set com.canonical.Unity.Panel systray-whitelist "$(gsettings get com.canonical.Unity.Panel systray-whitelist | sed -e "s/]$/, 'LeapControlPanel']/")"
If not a member of a plugdev group, add yourself with the command:
  sudo usermod -a -G plugdev $USER
then close all open sessions and log in again. Furthermore, if your Leap
Motion Controller is attached to a USB port, disconnect and reconnect.
Get started by running:
  leapd
And:
  LeapControlPanel
```

Now, you too can *feel like an epileptic gorilla trying to grab a stroboscopic e-banana* !

{% img center /images/posts/install-leap-motion-on-debian-wheezy/leap-gorilla-syndrom.jpg 'Angry gorilla trying early motion capture' %}


[^1]: see http://packages.debian.org/search?keywords=libc6