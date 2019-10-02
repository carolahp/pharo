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


To open the bootstrapper windows you must execute:
```Smalltalk
(PBBuilder newWithUICandleInDirectory: './PharoCandleSrc-1.0' asFileReference ) openUI.
(PBBuilder newWithUIInDirectory: './../../../src' asFileReference ) openUI.
```

# Hybrid Debugger

The Hybrid Debugger is for debugging semantic errors in your language definition.

First we need Spec2:
```Smalltalk
    Metacello new
        githubUser: 'pharo-spec' project: 'Spec' commitish: 'master' path: 'src';
        baseline: 'Spec2';
        onConflict: [ :e | e useIncoming ];
        onUpgrade: [ :e | e useIncoming ];
        ignoreImage;
        load
```

After we install the HybridDebugger
```Smalltalk
    Metacello new
        githubUser: 'carolahp' project: 'PBHybridDebugger' commitish: 'master' path: '';
        baseline: 'PBHybridDebugger';
        load
```
