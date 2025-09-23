
qemu-img create -f qcow2 debian_pwn.img 10G

qemu-system-x86_64 \
  -m 2048 \
  -cdrom debian.iso \
  -boot d \
  -hda debian_pwn.img \


