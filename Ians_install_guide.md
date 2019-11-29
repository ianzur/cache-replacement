# How I installed gem5
This is just a log of what I have done, because otherwise I will forget

I am installing on debian 10 (linux). Let me know if you want help installing linux on your machine.

### install required packages
```
sudo apt install mercurial scons swig gcc m4 python python-dev libgoogle-perftools-dev g++ libboost-all-dev`
```

### clone gem5 repository

```
hg clone http://repo.gem5.org/gem5
```

### set up architecture (X86 and gem5.opt)

```
cd gem5
scons build/X86/gem5.opt -j17
```

where -j17 == number of threads on my cpu+1

### test install (just a hello world test)

```
irz0002@raphy:~/Projects/gem5$ build/X86/gem5.opt configs/example/se.py -c tests/test-progs/hello/bin/x86/linux/hello

gem5 Simulator System.  http://gem5.org

gem5 is copyrighted software; use the --copyright option for details.



gem5 compiled Nov 12 2019 17:07:24

gem5 started Nov 12 2019 17:12:53

gem5 executing on raphy, pid 18449

command line: build/X86/gem5.opt configs/example/se.py -c tests/test-progs/hello/bin/x86/linux/hello



Global frequency set at 1000000000000 ticks per second

warn: DRAM device capacity (8192 Mbytes) does not match the address range assigned (512 Mbytes)

0: system.remote_gdb: listening for remote gdb on port 7000

**** REAL SIMULATION ****

info: Entering event queue @ 0.  Starting simulation...

Hello world!

Exiting @ tick 5941500 because exiting with last active thread context
```
