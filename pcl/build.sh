#!/bin/bash
mkdir -p build
cd build

CMAKE_GENERATOR="Unix Makefiles"

if [ "$(uname)" == "Linux" ]; then
  cmake .. -G "$CMAKE_GENERATOR" \
    -Wno-dev \
    -DCMAKE_BUILD_TYPE=Release \
    -DWITH_DOCS:BOOL=OFF \
    -DWITH_FZAPI:BOOL=OFF \
    -DWITH_LIBUSB:BOOL=OFF \
    -DWITH_OPENNI:BOOL=OFF \
    -DWITH_OPENNI2:BOOL=OFF \
    -DWITH_OPENGL:BOOL=ON \
    -DWITH_PCAP:BOOL=OFF \
    -DWITH_PNG:BOOL=OFF \
    -DWITH_PXCAPI:BOOL=OFF \
    -DWITH_QT:BOOL=OFF \
    -DWITH_QHULL:BOOL=ON \
    -DWITH_VTK:BOOL=ON \
    -DBUILD_tools:BOOL=OFF \
    -DBUILD_global_tests:BOOL=OFF \
    -DBUILD_2d:BOOL=ON \
    -DBUILD_CUDA:BOOL=OFF \
    -DBUILD_GPU:BOOL=OFF \
    -DBUILD_all_in_one_installer:BOOL=OFF \
    -DBUILD_apps:BOOL=OFF \
    -DBUILD_common:BOOL=ON \
    -DBUILD_example:BOOL=OFF \
    -DBUILD_features:BOOL=ON \
    -DBUILD_filters:BOOL=ON \
    -DBUILD_geometry:BOOL=ON \
    -DBUILD_global_tests:BOOL=OFF \
    -DBUILD_io:BOOL=ON \
    -DBUILD_kdtree:BOOL=ON \
    -DBUILD_keypoints:BOOL=ON \
    -DBUILD_octree:BOOL=ON \
    -DBUILD_outofcore:BOOL=ON \
    -DBUILD_people:BOOL=ON \
    -DBUILD_recognition:BOOL=ON \
    -DBUILD_registration:BOOL=ON \
    -DBUILD_sample_consensus:BOOL=ON \
    -DBUILD_search:BOOL=ON \
    -DBUILD_segmentation:BOOL=ON \
    -DBUILD_simulation:BOOL=OFF \
    -DBUILD_stereo:BOOL=ON \
    -DBUILD_surface:BOOL=ON \
    -DBUILD_surface_on_nurbs:BOOL=ON \
    -DBUILD_tracking:BOOL=ON \
    -DBUILD_visualization:BOOL=ON \
    -DBUILD_SHARED_LIBS:BOOL=ON \
    -DCMAKE_INSTALL_PREFIX="${PREFIX}" \
    -DBOOST_LIBRARYDIR="${PREFIX}"/lib \
    -DCMAKE_PREFIX_PATH="${PREFIX}" \
    -DCMAKE_EXE_LINKER_FLAGS=-L"${PREFIX}"/lib \
    -DCMAKE_MODULE_LINKER_FLAGS=-L"${PREFIX}"/lib \
    -DCMAKE_SHARED_LINKER_FLAGS=-L"${PREFIX}"/lib
fi


if [ "$(uname)" == "Darwin" ]; then
  cmake .. -G "$CMAKE_GENERATOR" \
    -Wno-dev \
    -DMACOSX_RPATH:BOOL=ON \
    -DCMAKE_BUILD_TYPE=Release \
    -DWITH_DOCS:BOOL=OFF \
    -DWITH_FZAPI:BOOL=OFF \
    -DWITH_LIBUSB:BOOL=OFF \
    -DWITH_OPENNI:BOOL=OFF \
    -DWITH_OPENNI2:BOOL=OFF \
    -DWITH_OPENGL:BOOL=ON \
    -DWITH_PCAP:BOOL=OFF \
    -DWITH_PNG:BOOL=OFF \
    -DWITH_PXCAPI:BOOL=OFF \
    -DWITH_QT:BOOL=OFF \
    -DWITH_QHULL:BOOL=ON \
    -DWITH_VTK:BOOL=ON \
    -DBUILD_apps:BOOL=OFF \
    -DBUILD_common:BOOL=ON \
    -DBUILD_example:BOOL=OFF \
    -DBUILD_features:BOOL=ON \
    -DBUILD_filters:BOOL=ON \
    -DBUILD_geometry:BOOL=ON \
    -DBUILD_global_tests:BOOL=OFF \
    -DBUILD_io:BOOL=ON \
    -DBUILD_kdtree:BOOL=ON \
    -DBUILD_keypoints:BOOL=ON \
    -DBUILD_octree:BOOL=ON \
    -DBUILD_outofcore:BOOL=ON \
    -DBUILD_people:BOOL=ON \
    -DBUILD_recognition:BOOL=ON \
    -DBUILD_registration:BOOL=ON \
    -DBUILD_sample_consensus:BOOL=ON \
    -DBUILD_search:BOOL=ON \
    -DBUILD_segmentation:BOOL=ON \
    -DBUILD_simulation:BOOL=OFF \
    -DBUILD_stereo:BOOL=ON \
    -DBUILD_surface:BOOL=ON \
    -DBUILD_surface_on_nurbs:BOOL=ON \
    -DBUILD_tracking:BOOL=ON \
    -DBUILD_visualization:BOOL=ON \
    -DBUILD_tools:BOOL=OFF \
    -DBUILD_SHARED_LIBS:BOOL=ON \
    -DCMAKE_INSTALL_PREFIX="${PREFIX}" \
    -DBOOST_LIBRARYDIR="${PREFIX}"/lib \
    -DCMAKE_PREFIX_PATH="${PREFIX}" \
    -DCMAKE_EXE_LINKER_FLAGS=-L"${PREFIX}"/lib \
    -DCMAKE_MODULE_LINKER_FLAGS=-L"${PREFIX}"/lib \
    -DCMAKE_SHARED_LINKER_FLAGS=-L"${PREFIX}"/lib \
    -DCMAKE_OSX_DEPLOYMENT_TARGET=''
fi

make
make install
