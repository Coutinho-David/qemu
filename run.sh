#!/usr/bin/env bash

set -e

IMG="debian_pwn.img"
ISO="debian.iso"
MEM=4096
CORES=2
CACHE="writeback"

boot_vm() {
    qemu-system-x86_64 \
        -machine type=q35 \
        -smp "$CORES" \
        -m "$MEM" \
        -netdev user,id=net0,hostfwd=tcp::2222-:22,hostfwd=tcp::1234-:1234 \
        -device virtio-net-pci,netdev=net0 \
        -drive file="$IMG",if=virtio,cache=$CACHE
}

echo "Virtual Machine Manager starting..."
if [ -f "$IMG" ]; then
    echo "[+] Booting existing VM..."
    boot_vm
else
    echo "Creating disk and starting installer..."
    qemu-img create -f qcow2 "$IMG" 10G
    qemu-system-x86_64 \
        -machine type=q35 \
        -smp "$SMP" \
        -m "$MEM" \
        -cdrom "$ISO" \
        -boot d \
        -netdev user,id=net0,hostfwd=tcp::2222-:22,hostfwd=tcp::1234-:1234 \
        -device virtio-net-pci,netdev=net0 \
        -drive file="$IMG",if=virtio,cache=$CACHE
fi

