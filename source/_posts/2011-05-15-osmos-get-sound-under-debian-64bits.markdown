---
layout: post
title: "Osmos ~ Get sound under Debian or Ubuntu 64bits"
date: 2011-05-15 15:05
comments: true
categories:
- Debian
- Ubuntu
- Linux

---

Fresh install, no sound.

Launched `/opt/Osmos/Osmos` :

```
—————————————————————————————————-
Commandline: ./Osmos.bin64
Preinitializing game: HEMI version 1.6.1 1568
Localization: using language “fr”
Localization: loaded Osmos-fr.loc
Arch: Intel(R) Core(TM) i7 CPU       Q 740  @ 1.73GHz
OS: Linux 2.6.38-2-amd64
Using sound
Showing splash
Using fullscreen mode: 1920 x 1080
Not using vsync
Initializing GLRenderDevice…
OpenGL version: 4.1.0 NVIDIA 270.41.06
Initializing game
Initializing GLRenderer…
Loading textures
Loading fonts
Backed up stats to Stats/Backup/Osmos_0018.sta
Initializing SoundSystem…
Initializing OpenAL
Getting OpenAL device list
Found 3 devices:
Device 0: PulseAudio Software (3: OPENAL DEFAULT)
Device 1: ALSA Software
Device 2: PortAudio Software
Pass 1: no valid device was specified (-1)
Pass 2: no valid device was specified (-1)
Pass 3: attempting device 0: “PulseAudio Software”…
Failed to open device
WARNING: Failed to initialize OpenAL
App exiting — bye!
Writing config to Config.cfg
—————————————————————————————————-
```

The problem is `WARNING: Failed to initialize OpenAL`.

## Solution

Install `alsoft-conf`.

Launch it, click Apply.

If it’s grey, fiddle with the configuration.
This will generate a config file for OpenAL with better default values than the ones provided by the package libopenal1.

[Bug reported](http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=612117).

_Now go bubble 'round the infinite universe !_
