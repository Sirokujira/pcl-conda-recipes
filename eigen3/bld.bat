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

rem eigen3.pc (i.e. pkg-config) file is needed by python-pcl
mkdir "%LIBRARY_LIB%/pkgconfig"
set PKG_CONFIG_LIBDIR=%LIBRARY_LIB%

rem -DINCLUDE_INSTALL_DIR=%LIBRARY_INC%\Eigen3 ^
rem https://stackoverflow.com/questions/13218646/cmake-pthread-h-not-found-in-windows
cmake .. -G %CMAKE_GENERATOR% ^
   -Wno-dev ^
   -DCMAKE_BUILD_TYPE=Release ^
   # -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
   # -DCMAKE_PREFIX_PATH=%LIBRARY_PREFIX% ^
   -DCMAKE_INSTALL_PREFIX=%PREFIX% ^
   -DCMAKE_PREFIX_PATH=%PREFIX% ^
   -DINCLUDE_INSTALL_DIR=%LIBRARY_INC% ^
   -DCMAKE_USE_WIN32_THREADS_INIT:BOOL=ON ^
   -DCMAKE_USE_PTHREADS_INIT:BOOL=OFF ^
   -DEIGEN_BUILD_PKGCONFIG:BOOL=OFF


cmake --build . --config Release --target ALL_BUILD
if errorlevel 1 exit 1

cmake --build . --config Release --target INSTALL
if errorlevel 1 exit 1