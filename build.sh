#!/bin/bash

make Device-Debug
blackberry-nativepackager -package cascades-bootstrap-debug.bar \
    -configuration Device-Debug \
    -devMode \
    -target bar \
    bar-descriptor.xml \
    icon.png \
    assets/*.qml \
    -e arm/o.le-v7-g/CascadesBootstrap CascadesBootstrap\
    -debugToken debugToken.bar
