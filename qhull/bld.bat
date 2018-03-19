@echo off

mkdir build
cd build

rem Need to handle Python 3.x case at some point (Visual Studio 2015)
if %ARCH%==32 (
  if %PY_VER% GEQ 3 (
    set CMAKE_GENERATOR="Visual Studio 14 2015"
  )
)

if %ARCH%==64 (
  if %PY_VER% GEQ 3 (
    set CMAKE_GENERATOR="Visual Studio 14 2015 Win64"
  )
)

cmake .. -G %CMAKE_GENERATOR% ^
   -Wno-dev ^
   -DCMAKE_BUILD_TYPE=Release ^
   -DCMAKE_INSTALL_PREFIX:PATH="%LIBRARY_PREFIX%" ^
   -DCMAKE_PREFIX_PATH:PATH="%LIBRARY_PREFIX%" ^
   -DBUILD_MATLAB_BINDINGS:BOOL=OFF ^
   -DBUILD_PYTHON_BINDINGS:BOOL=OFF

cmake --build . --config Release --target ALL_BUILD 1>output.txt 2>&1
rem if errorlevel 1 exit 1

cmake --build . --config Release --target INSTALL
rem if errorlevel 1 exit 1

