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

Hello, World.

.. code:: go

  package main

  import "fmt"

  func main() {
    fmt.Printf("Hello, world!\n")
  }

----

Line-by-line
############

.. Code:: go

  package main

Select a namespace; "main" is used

----

Questions?
##########

Not like I have answers.  But I'll do my best.

Adam Thornton

athornton@gmail.com
