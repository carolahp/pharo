# Why Generating Small Pharo Kernels?
A full Pharo image is too big for running in small hardware constrained devices (i.e. arduino), and in many cases we don't need all the capabilities of the system when the goal is to use it only for executing a specific application after deploying.

In this project we present the Pharo Bootstrapper application, which allows you to design and generate your own custom Pharo images (also named Kernels). 

# How does the Pharo Bootstrapper works?
The Pharo Bootstrapper is an application that runs in Pharo. It works by reading the source files (in Tonel format) where all the classes of your custom system are defined, and after by generating a .image file which can be executed using the headless Pharo Virtual Machine. 

This application was developed using the previous work of [@Guillep](https://github.com/guillep) on the [Pharo Bootstrap Process](https://github.com/guillep/PharoBootstrap).

# How to start generating small images using the Pharo Bootstrapper?
To play start playing with it, you need to clone this repository and checkout the branch candle 
```bash
git clone --branch bootstrapInPharo8 https://github.com/carolahp/pharo.git
cd pharo
```

To generate the environment for the Pharo Bootstrapper, execute the next command: 
(don't forget the -m flag, for manual, or it will explode! ... at least for now)
```bash
BUILD_NUMBER=42 BOOTSTRAP_ARCH=32 bash ./bootstrap/scripts/bootstrap.sh -m
```

A Pharo system will automatically start, showing the Pharo Bootstrapper window.
![alt text](https://github.com/carolahp/pharo/blob/bootstrapInPharo8/images/bootstrapper.png "Pharo Bootstrapper UI")

To open a Pharo Bootstrapper again you must execute:
```Smalltalk
PBBuilder new open
```

In your custom image you define any class of the system, even core classes such as Object, Class and Metaclass, the only limitation is the compatibility with the Pharo Virtual Machine.


# Debugging your image before deploying it

To be able to use the functionality "debug in generated image" you must install the Hybrid Debugger, which let you debugg semantic errors in your language definition before writing the image to disk and executing it with the Pharo VM.


After, install the HybridDebugger
```Smalltalk
Metacello new
githubUser: 'carolahp' project: 'PBHybridDebugger' commitish: 'master' path: '';
baseline: 'PBHybridDebugger';
load
```
