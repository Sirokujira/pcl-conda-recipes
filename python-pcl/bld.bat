@echo on

rem This is needed for pkg-config to detect pcl and eigen3 pc files
rem set PKG_CONFIG_PATH=%LIBRARY_LIB%\pkgconfig
rem cd pkg-config
rem powershell -NoProfile -ExecutionPolicy Unrestricted .\Install-GTKPlus.ps1
rem cd ..

rem warning : override pip package(python-pcl)
python setup.py install
