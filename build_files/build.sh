#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/43/x86_64/repoview/index.html&protocol=https&redirect=1

# Install ROCm runtime packages for LLM inference on AMD GPU
dnf5 install -y \
    hipblas \
    rocblas \
    rocm-hip \
    rocm-runtime \
    rocm-comgr \
    rocminfo

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
