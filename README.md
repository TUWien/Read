# Read
Contains main cmake to build to complete READ system (nomacs, ReadFramework, and ReadModules). The READ project has received funding from the European Union’s Horizon 2020 research and innovation programme under grant agreement No 674943.

note: to use this repository you need a github user and a publickey has to be uplodated to github (submodules of git are referenced via the ssh git@github.com url)

## Build on Windows

todo

## Build on Ubuntu
note: Qt 5.5 is needed, thus Ubuntu version must be >= 16.04 or backports of Qt 5.5 have to be used (see .travis.yml for an ppa repository and names packages which need to be installed)

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
git submodule update --init --remote --merge
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