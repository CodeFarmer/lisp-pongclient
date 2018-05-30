Common Lisp Pong Client
=======================

This is an extremely primitive client for
[pongserv](https://github.com/CodeFarmer/pongserv). I made it purely
as an exercise in figuring out how to get a Common Lisp program
running on Mac (though it also works on Linux).

It is not presently portable between Lisp implementations as it
requires `*posix-argv*` which is specific to SBCL, though this is
trivial to fix. It also does not play Pong very well.

Requirements
------------

* [SBCL](http://www.sbcl.org/) (or other Common Lisp implementation)
* [Quicklisp](https://www.quicklisp.org/beta/) needs to be installed and part of SBCL's init script, for
  * usocket
  * cl-json

Running
-------

```$ sbcl < pongclient.lisp <hostname>```

(Hostname is optional, default to localhost.)
