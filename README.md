#1 Create debian disk imageqemu-img

`qemu-img create -f qcow2 debian_pwn.img 10G`

(10 GB, or any other disk size).

#2 First boot and Install

Run the following command ot _setup.sh_

```
qemu-system-x86_64 \
  -m 2048 \
  -cdrom debian.iso \
  -boot d \
  -hda debian_pwn.img \
```

#3 Booting daily

Run the following command or the file _run.sh_

```
qemu-system-x86_64 \
  -m 2048 \
  -hda debian_pwn.img \
  -net nic -net user,hostfwd=tcp::2222-:22,hostfwd=tcp::1234-:1234
```

#4 Install all pwn tools

sudo apt install gdb gdbserver python3 python3-pip netcat-openbsd build-essential
pip3 install pwntools
git clone https://github.com/pwndbg/pwndbg
cd pwndbg
./setup.sh

#5. SSH to the machine

SSH to ssh -p 2222 <username>@localhost or root@<distro>

#6 copying files into machine

`scp -P 2222 /path/to/local/file <username>@localhost:/home/cdm/`

