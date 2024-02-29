# valgrind-arm64
## Containerized Valgrind and GDB to allow Apple Silicon users to debug code on their machines without the need for a VM. 

My idea stems from necessity, I am taking a university course in Computer Systems at Sapienza University of Rome, and I had to install a bulky virtual machine on my MacBook just to run those two programs. 

I set up my Dockerfile to create a new directory to set as working directory, this is for ease of use and compatibility among different machines (by not specifying a single directory on my personal machine anyone can use this). Feel free to substitute it with your preferred directory.

_Please note that the following steps are taken inside the same directory as the Dockerfile_


First, you have to build your docker container: ` docker build -t valgrind . `
After that, run that same container: `docker run -d -it --name valgrind_gdb valgrind`


With the container open, you may now attach that running container to VSC using the **Dev Containers** extension on VSC, and by selecting _attach to running container_.

### OPTIONAL

When inside the VSC terminal, edit via nano or your favorite editor the .gdbinit file, by entering `nano ~/.gdbinit` and paste inside that file the following:

```
define go
    start
    layout src
    layout regs
    focus cmd
end

```

This enables the source and registers layout when debugging using **gdb**, activated by the new command _"go"_.

_The optional section was taken from the [material](https://season-lab.github.io/SC/training/tools/gdb) provided by my professors_

_*Done*_
