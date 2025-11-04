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
CORES=2
```

ISO should be your downloaded .iso

IMG whatever you want to name it

MEM = mb of RAM (2048) = 2 GB RAM

CORES = number of cpu cores you wish qemu to use, the more , the better the performance

---

# If you didnt skip steps

Follow the command on `run.sh` to view how to create a disk, and boot the VM

---

# Install all pwn tools (optional)

```
sudo apt install gdb gdbserver python3 python3-pip netcat-openbsd build-essential
pip3 install pwntools
git clone https://github.com/pwndbg/pwndbg
cd pwndbg
./setup.sh
```
pwndbg is a gdb plugin for beter debugging of binaries.

# SSH'ing to the machine

`ssh -p 2222 <username>@localhost or root@<distro>`

# Copying files into machine

`scp -P 2222 /path/to/local/file <username>@localhost:/home/<username>/`

There are many more ways, some faster. Use whatever.
