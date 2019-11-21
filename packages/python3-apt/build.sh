TERMUX_PKG_HOMEPAGE="https://salsa.debian.org/apt-team/python-apt"
TERMUX_PKG_DESCRIPTION="Python 3 interface to libapt-pkg"
TERMUX_PKG_LICENSE="GPL-2.0"
TERMUX_PKG_MAINTAINER="Philipp Schmitt <philipp@schmitt.co>"
TERMUX_PKG_VERSION=1.4.0_beta3
TERMUX_PKG_REVISION=1
TERMUX_PKG_SRCURL="https://salsa.debian.org/apt-team/python-apt/-/archive/${TERMUX_PKG_VERSION}/python-apt-${TERMUX_PKG_VERSION}.tar.gz"
TERMUX_PKG_SHA256="80489a9e6cd68b3cc03a1a1d33c0f0d99cce99cef15166628d7d0729cd4e506c"
TERMUX_PKG_HOSTBUILD=false
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_DEPENDS="python"
TERMUX_PKG_BUILD_DEPENDS="python"

termux_step_make() {
	return
}

# termux_step_host_build() {
# 	export PYTHONPATH=$TERMUX_PREFIX/lib/python3.8/site-packages/
#   env
# 	python3.8 setup.py install --prefix=$TERMUX_PREFIX --force
# }

termux_step_make_install() {
	# export LD_LIBRARY_PATH="${TERMUX_PREFIX}/include/python3.8"
	# export PYTHONPATH=$TERMUX_PREFIX/lib/python3.8/site-packages/:$LD_LIBRARY_PATH
  # env
  # python3.8 setup.py config -I "/include/python3.8" -L "/include/python3.8"
  # export PYTHON_INCLUDE_PATH="${TERMUX_PREFIX}"
  # export PYTHON_INCLUDE_DIR=$TERMUX_PREFIX/include/python3.8
	# export PYTHONHOME="${TERMUX_PREFIX}/include/python3.8"
	export PYTHONPATH="${TERMUX_PREFIX}/lib/python3.8/site-packages/"
	env | sort
	python3.8 setup.py install --prefix=$TERMUX_PREFIX --force
}

# termux_step_make_install() {
# 	export PYTHONPATH=$TERMUX_PREFIX/lib/python3.8/site-packages/
# 	python3.8 setup.py install --prefix=$TERMUX_PREFIX --force
# }

termux_step_post_massage() {
	find . -path '*/__pycache__*' -delete
}
