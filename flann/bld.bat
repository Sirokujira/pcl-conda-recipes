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
   -DCMAKE_BUILD_TYPE:STRING="Release" ^
   -DCMAKE_INSTALL_PREFIX:PATH="%LIBRARY_PREFIX%" ^
   -DCMAKE_PREFIX_PATH:PATH="%LIBRARY_PREFIX%" ^
   -DCMAKE_WINDOWS_EXPORT_ALL_SYMBOLS:BOOL=ON ^
   -DBUILD_EXAMPLES:BOOL=OFF ^
   -DBUILD_TESTS:BOOL=OFF ^
   -DBUILD_DOC:BOOL=OFF ^
   -DBUILD_C_BINDINGS:BOOL=ON ^
   -DBUILD_MATLAB_BINDINGS=OFF ^
   -DBUILD_PYTHON_BINDINGS=OFF

cmake --build . --config Release --target ALL_BUILD 1>output.txt 2>&1
if errorlevel 1 exit 1

del %LIBRARY_PREFIX%\bin\msvcp140.dll
del %LIBRARY_PREFIX%\bin\vcruntime140.dll
del %LIBRARY_PREFIX%\bin\concrt140.dll

rem %LIBRARY_PREFIX%\bin\cmake.exe -DCMAKE_INSTALL_COMPONENT:STRING="non" -DBUILD_TYPE=Release -P cmake_install.cmake
%LIBRARY_PREFIX%\bin\cmake.exe -DBUILD_TYPE=Release -P cmake_install.cmake

rem cmake --build . --config "Release" --target install
rem if errorlevel 1 exit 1

rem ALL_BUILD.vcxproj - Command
rem setlocal
rem %LIBRARY_PREFIX%\bin\cmake.exe -DBUILD_TYPE=Release -P cmake_install.cmake
rem if %errorlevel% neq 0 goto :cmEnd
rem :cmEnd
rem endlocal &amp; call :cmErrorLevel %errorlevel% &amp; goto :cmDone
rem :cmErrorLevel
rem exit /b %1
rem :cmDone
rem if %errorlevel% neq 0 goto :VCEnd

