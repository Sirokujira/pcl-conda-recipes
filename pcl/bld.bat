@echo on

mkdir build
cd build

rem Need to handle Python 3.x case at some point (Visual Studio 2015)
if %ARCH%==32 (
  if %PY_VER% GEQ 3 (
    set CMAKE_GENERATOR="Visual Studio 14 2015"
    rem set CMAKE_GENERATOR="Visual Studio 15 2017"
  )
)

if %ARCH%==64 (
  if %PY_VER% GEQ 3 (
    set CMAKE_GENERATOR="Visual Studio 14 2015 Win64"
    rem set CMAKE_GENERATOR="Visual Studio 15 2017 Win64"
  )
)

rem set BOOSTDIR=%LIBRARY_INC%\Boost
rem set EIGEN3DIR=%LIBRARY_INC%\Eigen3
rem set FLANNDIR=%LIBRARY_INC%\FLANN
rem set QHULLDIR=%LIBRARY_INC%\Qhull
cmake .. -G %CMAKE_GENERATOR% ^
  -Wno-dev ^
  -DCMAKE_BUILD_TYPE=Release ^
    -DWITH_DOCS:BOOL=OFF ^
    -DWITH_FZAPI:BOOL=OFF ^
    -DWITH_LIBUSB:BOOL=OFF ^
    -DWITH_OPENNI:BOOL=OFF ^
    -DWITH_OPENNI2:BOOL=OFF ^
    -DWITH_OPENGL:BOOL=ON ^
    -DWITH_PCAP:BOOL=OFF ^
    -DWITH_PNG:BOOL=OFF ^
    -DWITH_QT:BOOL=OFF ^
    -DWITH_QHULL:BOOL=ON ^
    -DWITH_VTK:BOOL=ON ^
    -DBUILD_tools:BOOL=OFF ^
    -DBUILD_global_tests:BOOL=OFF ^
    -DBUILD_2d:BOOL=ON ^
    -DBUILD_CUDA:BOOL=OFF ^
    -DBUILD_GPU:BOOL=OFF ^
    -DBUILD_all_in_one_installer:BOOL=OFF ^
    -DBUILD_apps:BOOL=OFF ^
    -DBUILD_common:BOOL=ON ^
    -DBUILD_example:BOOL=OFF ^
    -DBUILD_features:BOOL=ON ^
    -DBUILD_filters:BOOL=ON ^
    -DBUILD_geometry:BOOL=ON ^
    -DBUILD_global_tests:BOOL=OFF ^
    -DBUILD_io:BOOL=ON ^
    -DBUILD_kdtree:BOOL=ON ^
    -DBUILD_keypoints:BOOL=ON ^
    -DBUILD_octree:BOOL=ON ^
    -DBUILD_outofcore:BOOL=ON ^
    -DBUILD_people:BOOL=ON ^
    -DBUILD_recognition:BOOL=ON ^
    -DBUILD_registration:BOOL=ON ^
    -DBUILD_sample_consensus:BOOL=ON ^
    -DBUILD_search:BOOL=ON ^
    -DBUILD_segmentation:BOOL=ON ^
    -DBUILD_simulation:BOOL=OFF ^
    -DBUILD_stereo:BOOL=ON ^
    -DBUILD_surface:BOOL=ON ^
    -DBUILD_surface_on_nurbs:BOOL=ON ^
    -DBUILD_tracking:BOOL=ON ^
    -DBUILD_visualization:BOOL=ON ^
    -DBUILD_SHARED_LIBS:BOOL=ON ^
    -DCMAKE_INSTALL_PREFIX:PATH="%LIBRARY_PREFIX%" ^
    -DCMAKE_PREFIX_PATH:PATH="%LIBRARY_PREFIX%" ^
    -DBOOST_LIBRARYDIR:PATH=%LIBRARY_PREFIX% ^
    -DCMAKE_EXE_LINKER_FLAGS=-L%LIBRARY_PREFIX% ^
    -DCMAKE_MODULE_LINKER_FLAGS=-L%LIBRARY_PREFIX% ^
    -DCMAKE_SHARED_LINKER_FLAGS=-L%LIBRARY_PREFIX%


cmake --build . --config Release --target ALL_BUILD 1>output.txt 2>&1
if errorlevel 1 exit 1

del %LIBRARY_PREFIX%\bin\msvcp140.dll
del %LIBRARY_PREFIX%\bin\vcruntime140.dll
del %LIBRARY_PREFIX%\bin\concrt140.dll

%LIBRARY_PREFIX%\bin\cmake.exe -DBUILD_TYPE=Release -P cmake_install.cmake

rem cmake --build . --config Release --target INSTALL
rem if errorlevel 1 exit 1
