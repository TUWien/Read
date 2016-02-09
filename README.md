# Read
Contains main cmake of the ReadFramework to build to complete system


## Build on Ubuntu
note that Qt 5.5 is needed, thus Ubuntu version must be >= 16.04 or backports of Qt 5.5 have to be used (see .travis.yml for an ppa repository and names packages which need to be installed)

Get required packages:

``` console
sudo apt-get install qt5-qmake qttools5-dev-tools qt5-default libqt5svg5-dev qt5-image-formats-plugins libopencv-dev cmake git libexiv2-dev libraw-dev
```

Get sources from github:
``` console
git clone https://github.com/TUWien/Read
```
This will by default place the source into ./Read
Go to the Read directory and update the submodules
``` console
cd Read
git submodules update
cmake .
```
Compile READ: 
``` console
make
```

The binaries are then located in a new Directory called "READ" (./Read/READ)

### authors
Markus Diem
Stefan Fiel
Florian Kleber

### related links:
[1] http://www.caa.tuwien.ac.at/cvl/
[2] https://transkribus.eu/Transkribus/
[3] https://github.com/TUWien/
[4] http://nomacs.org