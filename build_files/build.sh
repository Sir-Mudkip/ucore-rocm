#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/43/x86_64/repoview/index.html&protocol=https&redirect=1

# Install ROCm and HIP packages from Fedora repos
dnf5 install -y \
    hipblas-devel \
    hipblaslt-devel \
    hipcc \
    hipcc-libomp-devel \
    hipcub-devel \
    hipfft-devel \
    hipfort-devel \
    hiprand-devel \
    hiprt-devel \
    hipsolver-devel \
    hipsparse-devel \
    rocalution-devel \
    rocblas-devel \
    rocfft-devel \
    rocm-clang-devel \
    rocm-clang-tools-extra-devel \
    rocm-cmake \
    rocm-comgr-devel \
    rocm-core-devel \
    rocm-hip-devel \
    rocm-libc++-devel \
    rocm-libc++-static \
    rocm-llvm-devel \
    rocm-omp-devel \
    rocm-runtime-devel \
    rocm-rpp-devel \
    rocm-smi-devel \
    rocminfo \
    rocdecode-devel \
    rocjpeg-devel \
    rocprim-devel \
    rocrand-devel \
    rocsolver-devel \
    rocsparse-devel \
    rocthrust-devel \
    roctracer-devel \
    miopen

dnf5 clean all
rm -rf /tmp/* /var/tmp/*

# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging

#### Example for enabling a System Unit File

systemctl enable podman.socket

## Cleanup
/ctx/cleanup.sh
