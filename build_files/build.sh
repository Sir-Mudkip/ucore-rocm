#!/bin/bash

set -ouex pipefail

### ==========================================================================
### GPU: ROCm packages for AMD GPU compute (LLM inference via Ollama)
### ==========================================================================
dnf5 install -y \
    hipblas \
    rocblas \
    rocm-hip \
    rocm-runtime \
    rocm-comgr \
    rocminfo \
    rocm-smi

### ==========================================================================
### MONITORING: System observability tools
### ==========================================================================
dnf5 install -y \
    btop \
    lm_sensors \
    nvme-cli

### ==========================================================================
### MONITORING: Network observability tools
### ==========================================================================
dnf5 install -y \
    iftop \
    nethogs

### ==========================================================================
### DEBUGGING: Host-level diagnostic tools
### ==========================================================================
dnf5 install -y \
    tcpdump \
    iotop \
    strace \
    ethtool

### ==========================================================================
### CLI TOOLS & EDITOR
### ==========================================================================
dnf5 install -y \
    neovim \
    git \
    gh \
    ripgrep \
    fzf \
    fastfetch \
    bash-completion

### ==========================================================================
### KUBERNETES: CLI tools for cluster management
### ==========================================================================
dnf5 install -y \
    kubernetes-client \
    helm \
    kind \
    k9s

### ==========================================================================
### SERVICES
### ==========================================================================
dnf5 install -y \
    syncthing

### ==========================================================================
### CLEANUP & SERVICES
### ==========================================================================
dnf5 clean all
rm -rf /tmp/* /var/tmp/*

systemctl enable podman.socket
systemctl enable syncthing@siva.service

## Cleanup
/ctx/cleanup.sh
