\qemu-system-x86_64 \
  -m 2048 \
  -hda debian_pwn.img \
  -net nic -net user,hostfwd=tcp::2222-:22,hostfwd=tcp::1234-:1234

