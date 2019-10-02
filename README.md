# Generating small Images using the Pharo Bootstrapper
The Pharo Bootstrapper is a Pharo image who is able to generate other images from its sources. To play with it, follow the next steps:


First clone this repository and checkout the branch candle 
```bash
git clone https://github.com/carolahp/pharo.git
cd pharo
git checkout origin/candle
```

Generate the Pharo Bootstrapper image by executing: 
(don't forget the -m flag or it will explode! ... at least for now)
```bash
BUILD_NUMBER=42 BOOTSTRAP_ARCH=32 bash ./bootstrap/scripts/bootstrap.sh -m
```

The Pharo Bootstrapper image is open and ready to use.

# Hybrid Debugger

To use the Hybrid Debugger for debugging semantic errors in your language definition you must install it.
In a playground in the PharoBootstrapper execute:
```Smalltalk
    Metacello new
        githubUser: 'carolahp' project: 'PBHybridDebugger' commitish: 'master' path: 'src';
        baseline: 'PBHybridDebugger';
        onConflict: [ :e | e useIncoming ];
        onUpgrade: [ :e | e useIncoming ];
        ignoreImage;
        load
```

