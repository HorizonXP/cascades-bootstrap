#!/bin/bash

make Device-Release
blackberry-nativepackager -package cascades-bootstrap-release.bar \
    -configuration Device-Release \
    -devMode \
    -target bar \
    bar-descriptor.xml \
    icon.png \
    assets/*.qml \
    -e arm/o.le-v7/CascadesBootstrap CascadesBootstrap.so\
