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

if %PY_VER% == 3.5 (
    set PYLIB="python35.lib"
)

if %PY_VER% == 3.6 (
    set PYLIB="python36.lib"
)


cmake .. -G %CMAKE_GENERATOR% ^
  -Wno-dev ^
  -DCMAKE_BUILD_TYPE=Release ^
  -DCMAKE_INSTALL_PREFIX:PATH="%LIBRARY_PREFIX%" ^
  -DCMAKE_PREFIX_PATH:PATH="%LIBRARY_PREFIX%" ^
  -DCMAKE_INSTALL_RPATH:PATH=%LIBRARY_LIB% ^
  -DCMAKE_INSTALL_NAME_DIR=%LIBRARY_LIB% ^
  -DBUILD_DOCUMENTATION:BOOL=OFF ^
  -DVTK_HAS_FEENABLEEXCEPT=OFF ^
  -DBUILD_TESTING:BOOL=OFF ^
  -DBUILD_EXAMPLES:BOOL=OFF ^
  -DVTK_USE_BOOST:BOOL=ON ^
  -DBUILD_SHARED_LIBS:BOOL=ON ^
  -DVTK_WRAP_PYTHON:BOOL=OFF ^
  -DPYTHON_EXECUTABLE=%PYTHON% ^
  -DPYTHON_INCLUDE_PATH=%PREFIX%\include ^
  -DPYTHON_LIBRARY=%PREFIX%\libs\%PYLIB% ^
  -DVTK_INSTALL_PYTHON_MODULE_DIR=%PREFIX%\Lib\site-packages ^
  -DVTK_RENDERING_BACKEND=OpenGL \
  -DVTK_USE_OFFSCREEN:BOOL=ON
  rem -DModule_vtkRenderingMatplotlib=ON

cmake --build . --config Release --target ALL_BUILD
if errorlevel 1 exit 1

cmake --build . --config Release --target INSTALL
if errorlevel 1 exit 1
