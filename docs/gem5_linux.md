# Gem5 Debian 10 Installation

## Required packages
```
$ sudo apt-get install\
  mercurial\
  scons\
  swig\
  gcc\
  m4\
  python\
  python-dev\
  libgoogle-perftools-dev\
  g++\
  libboost-all-dev
```

## Clone Gem5 repository

If using Mercurial:

```
$ hg clone http://repo.gem5.org/gem5
```

If using Git:
```
$ git clone --depth=1 git@github.com:gem5/gem5.git
```

## Build for X86 architecture

Specify the `-jN` flag where `N` is the number of threads to run the build with. For example:

```
$ cd gem5

$ scons build/X86/gem5.opt -j17
```

## Verify Installation

```
$ build/X86/gem5.opt configs/example/se.py -c tests/test-progs/hello/bin/x86/linux/hello

<Gem5 misc. info>

**** REAL SIMULATION ****

info: Entering event queue @ 0.  Starting simulation...

Hello world!

Exiting @ tick 5941500 because exiting with last active thread context
```
