set -e

IMG="debian_pwn.img"
ISO="debian.iso"
MEM=2048

echo "[*] Virtual Machine Manager starting..."
echo "[*] Using disk image: $IMG"
echo "[*] Using installer ISO: $ISO"
echo "[*] Allocating $MEM MB RAM"

if [ -f "$IMG" ]; then
  echo "[+] Disk image already exists."
  echo "[*] Booting existing VM..."
  echo "    - Networking enabled with port forwarding:"
  echo "      host 2222 -> guest 22 (SSH)"
  echo "      host 1234 -> guest 1234"
  qemu-system-x86_64 \
    -m "$MEM" \
    -hda "$IMG" \
    -net nic \
    -net user,hostfwd=tcp::2222-:22,hostfwd=tcp::1234-:1234
else
  echo "[*] Disk image not found. Creating a new 10G qcow2 disk..."
  qemu-img create -f qcow2 "$IMG" 10G
  echo "[+] Disk image created: $IMG"
  echo "[*] Booting Debian installer..."
  echo "    - Boot from CD-ROM ($ISO)"
  echo "    - Hard disk: $IMG"
  qemu-system-x86_64 \
    -m "$MEM" \
    -cdrom "$ISO" \
    -boot d \
    -hda "$IMG"
fi

