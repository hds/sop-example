# Single-Object Prelink Example

Xcode has a setting called Single-Object Prelink, which allows libraries and
frameworks to include the necessary symbols from other libraries so that the
underlying libraries do not need to be linked against in an application using
your framework.

This repository contains a simple example of how to do this using the standard
toolchain from the command line. The Makefiles in this example are deliberately
simplistic, and don't use the power of Make, for clarity.

The main executable `sop` depends on the library `libbrisbane`. Internally,
`libbrisbane` uses `libadelaide`. However neither the `libbrisbane` headers,
nor the executable `sop` depend explicitly on `libadelaide`.

We will build a version of `libbrisbane` which contains the required symbol
files from `libadelaide`, meaning that when we build `sop`, we only need to
link against `libbrisbane` and so we don't need to know anything about
`libadelaide` at all.

The key step is on line 19 of `brisbane/Makefile`:

    $(LD) -r -o brisbane-prelink.o b_one.o b_two.o ../adelaide/libadelaide.a

Instead of using the archive tool (`ar`) to build a static library from the
two object files `b_one.o` and `b_two.o`, we instead create a prelink file
linking the two object files against `libadelaide`. The `-r` flag tells the
linker to output another object file, rather than a final linked image.

We then use `ar` to build the final static library, but now it only has one
input, the prelinked object file `brisbane-prelink.o`.
