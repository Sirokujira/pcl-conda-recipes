Conda recipes to create packages for the Point Cloud Library (PCL)
and its Python bindings on Windows, Mac and Linux.

See http://pointclouds.org/

[pcl-conda-recipes reference source code](https://github.com/ccordoba12/pcl-conda-recipes "pcl-conda-recipes reference source code")

[![Anaconda-Server Badge](https://anaconda.org/sirokujira/python-pcl/badges/version.svg)](https://github.com/sirokujira/pcl-conda-recipes)
[![Anaconda-Server Badge](https://anaconda.org/sirokujira/python-pcl/badges/platforms.svg)](https://github.com/sirokujira/pcl-conda-recipes)
[![Anaconda-Server Badge](https://anaconda.org/sirokujira/python-pcl/badges/downloads.svg)](https://github.com/sirokujira/pcl-conda-recipes)
[![Anaconda-Server Badge](https://anaconda.org/sirokujira/python-pcl/badges/license.svg)](LICENSE.txt)

* Warning : 
  The current python-pcl package uses "module Fork strawlab(base v0.3.0 rc1)"

  Add pcl.pcl_visualization(use Windows/MacOSX/Ubuntu).

  base pcl version 1.8.1.

---

set install process

[packages files](https://anaconda.org/sirokujira/python-pcl "packages files")

* `conda config --add channels conda-forge`
* `conda config --add channels sirokujira`
* `conda install python-pcl --yes`

---

build process

build module clear.
* `conda build purge`

before setting tools
* [Visual Studio 2015 C++ Compiler Tools](https://visualstudio.microsoft.com/vs/older-downloads/ "external-Tools")

before install conda-forge packages
* `conda install --channel=conda-forge cmake`               (only on Linux and Mac)

* `conda install --channel=conda-forge vs2015_runtime`      (only on Windows)

* `conda install --channel=conda-forge cmake=3.10.0`        (only on Windows[3.9.6 use vs2013_runtime])

* `conda install --channel=conda-forge pkg-config`          (only on Linux and Mac[no use Windows])

* `conda install --channel=conda-forge m2-patch`            (only on Windows[or git command PATH Environment setting.])
   [m2-patch](https://anaconda.org/msys2/m2-patch "m2-patch")

* `conda install --channel=conda-forge vtk=8.0.1`           (only on Linux[For Windows, "build" in VisualStudio is required])
   [vtk-feedstock](https://github.com/conda-forge/vtk-feedstock "vtk-feedstock")

* `conda install --channel=conda-forge eigen=3.3.3`
   [eigen-feedstock](https://github.com/conda-forge/eigen-feedstock "eigen-feedstock")

* `conda install --channel=conda-forge boost=1.64.0`
   [boost-feedstock](https://github.com/conda-forge/boost-feedstock "boost-feedstock")

* `conda install --channel=conda-forge flann=1.9.1`
   [flann-feedstock](https://github.com/conda-forge/flann-feedstock "flann-feedstock")

* `conda install --channel=conda-forge qhull=2015.2`
   [qhull-feedstock](https://github.com/conda-forge/qhull-feedstock "qhull-feedstock")

The build order to follow is this:

* `conda build icu`         (only on Linux and Mac)
* `conda build vtk`         (only on Mac/Windows)

before build pcl

* `conda install vtk --use-local`   (only on Mac)

* `conda build pcl`

before build python-pcl

* `conda install pcl --use-local`
* `conda build python-pcl --python=2.7`
* `conda build python-pcl --python=3.5`
* `conda build python-pcl --python=3.6`

local install

* conda install pcl --use-local

**Note**: We're using Visual Studio 2015 on Windows.
Unfortunately, older compilers make `python-pcl` to segfault.

---

Features?

* move conda-forge-recipes?
  [staged-recipes](https://github.com/conda-forge/staged-recipes "staged-recipes")

* I plan to change the python-pcl github source reference from "strawlab fork repo" to "base (strawlab) repo".

