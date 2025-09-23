# Download an ISO

I use debian you use whatever you want, I recommend debian tho.

---

# SKIP STEPS

You an skip all steps and just run.

```
chmod +x run.sh
./run.sh
```

You can change these variables and disk size on the script.

```
IMG="debian_pwn.img"
ISO="debian.iso"
MEM=2048
```

ISO should be your downloaded .iso

IMG whatever you want to name it
MEM = mb of RAM (2048) = 2 GB RAM

---

# If you didnt skip steps

## Create debian disk imageqemu-img

`qemu-img create -f qcow2 debian_pwn.img 10G`

(10 GB, or any other disk size).

Name it whatever

# Install

Run the following command

```
qemu-system-x86_64 \
  -m 2048 \
  -cdrom debian.iso \
  -boot d \
  -hda debian_pwn.img \
```

# Booting daily

Run the following command. So all files and changes are always saved on the disk image.

```
qemu-system-x86_64 \
  -m 2048 \
  -hda debian_pwn.img \
  -net nic -net user,hostfwd=tcp::2222-:22,hostfwd=tcp::1234-:1234
```

# Install all pwn tools (optional)

```
sudo apt install gdb gdbserver python3 python3-pip netcat-openbsd build-essential
pip3 install pwntools
git clone https://github.com/pwndbg/pwndbg
cd pwndbg
./setup.sh
```
pwndbg is a gdb wrapper for beter debugging of binaries.

# SSH'ing to the machine

`ssh -p 2222 <username>@localhost or root@<distro>`

# Copying files into machine

`scp -P 2222 /path/to/local/file <username>@localhost:/home/<username>/`

There are many more ways, some faster. Use whatever.
