:css: css/talk.css

.. That's the light-background version.

.. Commenting out :css: css/talk_dark.css

..  Swap that in if you want the dark-background version

:title: Go: It Mostly Doesn't Suck
:author: Adam Thornton

Go: It Mostly Doesn't Suck
##########################

Adam Thornton
=============

Speaking As A Private Individual
================================

athornton@gmail.com

----

.. role:: raw-role(raw)
    :format: html

.. role:: strike
    :class: strike

Preliminaries
#############

All software sucks.

All hardware sucks.

All users suck.

I hope to convince you in the next few dozen minutes that Go sucks less than most software.

----

tl;dr
#####

.. image:: images/Learn-Go.png
  :height: 400px

Apologies to Randall Monroe

https://xkcd.com/918/

----

You Can Leave Now
#################

That was the important part.

----

Yeah, But What Does That Even *Mean*?
#####################################

If Go feels like **programming**, then...

...C feels like programming naked,

...Python feels like programming with training wheels,

...Perl feels like unicycling naked,

...LISP feels like wielding an elegant weapon for a more civilized age,

...Java feels like programming while wearing mittens,

...COBOL feels like programming while wearing handcuffs and drunk in the back of a police cruiser,

...and PHP feels like punching yourself in the balls over and over.

----

A Slightly Less Pungent Version?
################################

Ways Go is like C (an incomplete list):

- Small: 25 keywords

  - C:

    - ANSI C: 32
    - C99: 36
    - C11: 45

  - Java: 50
  - PHP: 67

- Statically typed
- Ken Thompson and Rob Pike wrote a lot of it
- Fundamentally procedural
- Programming hipsters hate it

----

But then why not just use C?
############################

Things Go Does Better Than C (an incomplete list):

- No explicit memory management
- Much better type-safety
- Very rich set of standard libraries
- Import dependency management
- The range operator
- Interfaces
- Concurrency
- Native map type
- A 2006 view of what's cheap and expensive, not a 1975 view

----

Enough Theory
#############

Hello, World
============

.. code:: go

  package main

  import "fmt"

  func main() {
    fmt.Println("Hello, world!")
  }

----

Line-by-line
############

.. Code:: go

    package main

Select a package; "main" is used for commands.

.. Code:: go

    import "fmt"

Packages each have their own namespace; ``fmt`` is for text formatting.

.. Code:: go

      func main() {

Just like in C, the primary entry point is called ``main()``.  In Go, ``main()`` takes no arguments and returns nothing.

  - If you're wondering, ``os.Argv`` is where the rest of the command line lives.

.. Code:: go

        fmt.Println("Hello, world!")

Println comes from the ``fmt`` package.  It is capitalized (we'll see why later), and adds a newline to the end of its arguments.

.. Code:: go

      }

Closes the function (and ends the program).

----

Packages
########

Standard library is quite large: math library (including complex and arbitrary precision numbers ), HTTP, regular expressions, JSON and XML encoding, 2D graphics....

No separate header files: the prologue of a Go binary package contains function names and their signatures.

Imports are done on a per-file basis.  That completely obviates the need for

.. code:: c

  #ifndef _GONKULATOR_H
  #define _GONKULATOR_H
  /* Code goes here */
  #endif /* gonkulator.h */

...and unused imports are a fatal compile-time error.

- You will start off by cursing this.
- Within a month you will wonder how you ever lived without it.

----

Packages and Linkers and Stuff
##############################

Oh My
=====

Exported functions' names start with an uppercase letter.

- This is another thing that you will start off with "what kind of Mickey Mouse crap is this?" and within a month you will just accept it as a totally reasonable convention.

Everything is statically linked.

- No dependency hell.

- Yes, executables are big; but disk space is cheap now and it's not like you have to move a 20MB file from place to place across a 300-baud modem link, right?

- This does mean that if you are using a buggy library, you need to rebuild and redeploy.  Go works well in a rebuild-the-world sort of environment, and less well in a traditional patch-the-things setting.

----

Remote Imports
##############

.. role:: strike
    :class: strike

.. code:: go

  import (
    "github.com/gonkulator/libkv/store"
  )

The dependency fetcher (``go get``) is smart enough to know that github uses git.  It knows about Bitbucket, GitHub, :strike:`Google Code Project Hosting`, Launchpad, and IBM DevOps Services.

You can also define private repositories, using any of Bazaar, Git, Mercurial, or Subversion.

- If you're still using CVS, may God have mercy on your soul.

----

Namespace Collisions
####################

.. code:: go

  import (
    "crypto/tls"
    aztls "github.com/Azure/azure-sdk-for-go/core/tls"
  )

Refer to the standard TLS package as "tls" and Azure's as "aztls".

Package functions are always referred to as package dot function.  So you're free to have both:

::

  math.Tan()
  salon.Tan()

- So you can't have the case where you call ``Tan()`` and it runs the one from the ``salon`` package when you thought you were calling the ``math`` one.

- Or ```redefinition of 'Tan'``.

- Since all dependencies are explicit and done at the file level, you also can't get into the situation where the app depends on version ``1.2.16`` of ``log4j``, but one of its other dependencies imported version ``1.2.11`` before your import happened.  Not that this has ever happened anywhere I ever worked.

----

Dependency Versioning
#####################

This is one of the things you're going to hear programming hipsters hate on Go about.  They have a point.

``godep`` is pretty dreadful, actually.

I haven't used ``glide``.

The ``GO15VENDOREXPERIMENT`` didn't really work.  Not all experiments do.

``gopkg.in`` is amusing.  It uses git tag conventions to redirect an import of ``gopkg.in/user/pkg.v3`` to ``github.com/user/pkg`` with tag ``v3`` or tag ``v3.x`` or ``v3.x.y``.  That's still pretty hinky and ad-hoc, though.

But anyone who insists super-stridently about this is blowing smoke and concern trolling you anyway.  It's definitely Not That Terrible.

----

Questions?
##########

Not like I have answers.  But I'll do my best.

Adam Thornton

athornton@gmail.com
