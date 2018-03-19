#!/bin/sh

cp -n ./travisCI/pcl_2d-1.8.pc ${PREFIX}/lib/pkgconfig/pcl_2d-1.8.pc
# cp -n ~/pcl-conda-recipes/python-pcl/pcl_visualization-1.8.pc ${PREFIX}/lib/pkgconfig/pcl_visualization-1.8.pc

CC=gcc CXX=g++ python setup.py install
# MacOSX gcc?
# MACOSX_DEPLOYMENT_TARGET=10.6 CC=gcc CXX=g++ python setup.py install
# MacOSX clang?
# MACOSX_DEPLOYMENT_TARGET=10.9 CC=clang CXX=clang++ python setup.py install