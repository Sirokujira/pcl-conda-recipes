set BOOSTDIR=%SRC_DIR%\boost

"%SRC_DIR%\boost_1_64_0-msvc-14.0-%ARCH%.exe" /SILENT /DIR="%BOOSTDIR%"
if errorlevel 1 exit 1

xcopy "%BOOSTDIR%\boost" "%LIBRARY_INC%\boost" /s /e /i
if errorlevel 1 exit 1

xcopy "%BOOSTDIR%"\lib%ARCH%-msvc-14.0\*vc140-mt-1_64.lib "%LIBRARY_LIB%"
if errorlevel 1 exit 1

xcopy "%BOOSTDIR%"\lib%ARCH%-msvc-14.0\*vc140-mt-1_64.dll "%LIBRARY_BIN%"
if errorlevel 1 exit 1
