# Gem5 Debian 10 Installation

## Required packages
```Bash
apt install mercurial scons swig gcc m4 python python-dev libgoogle-perftools-dev g++ libboost-all-dev zlib1g-dev
```

## Clone our repo and my fork of the Gem5 repo
We add a few files to the `gem5/configs/` folder

```Bash
git clone --recurse-submodules <our-repo-url>
```

## Build for X86 architecture

Specify the `-jN` flag where `N` is the number of threads to run the build with. For example:

```Bash
cd gem5
scons build/X86/gem5.opt -j17
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
