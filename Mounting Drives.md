# Mounting Shared Drives in Linux (Debian)

The manual steps to mount your shared drives in linux are mentioned below, and are verified steps at the time of writing for Debian based systems (Ubuntu, Pop OS, etc...)

## Step 1: Locate and modify your fstab file

- This file should be located in your etc directory
```bash
cd /etc
```
- Open the fstab file using your favourite text editor (vim is the only right answer!)
```bash
vim fstab
```
- Add the following lines at the end of your fstab file, while replacing <span style="color: violet;">'uqname'</span> with your username and adding your password after _'password='_ 
```
//file.eait.uq.edu.au/uqname /media/H_drive cifs  username=uqname,password=,domain=uq,_netdev,file_mode=0777,dir_mode=0777,user 0 0

//file.eait.uq.edu.au/groups /media/G_drive cifs username=uqname,password=,domain=UQ.EDU.AU,uid=1000,gid=1000 0 0

//file.eait.uq.edu.au/software /media/S_drive cifs   username=uqname,password=,domain=uq.edu.au,uid=1000,gid=1000 0 0
```
## Step 2: Creating relevant directories and installing cifs-utils
- The above steps lets your system know the adresss to look for to access your shared drives and the directory to assign that address to. Currently the shared drives are assigned to folders called H_drive, G_drive, and S_drive in the /media directory in your system. These folders likely do not currently exist in your system and you would need to create them (the sudo command is needed as you are creating folders in the /media directory, root something something)

```bash
cd /media
sudo mkdir H_drive
sudo mkdir G_drive
sudo mkdir S_drive

sudo apt install cifs-utils
```

## Step3: Mount your drives
- The final step is to finally mount your drives after all that hard work

```bash
sudo mount -a
```

- The '-a' argument is asking the computer to mount all drives in the fstab file and if no mistakes were made, you should be able to access your shared drives now.

- Do note that, sometimes, you would need to repeat step 3 after a reboot to mount your drives again. There are magical linux ways to skip this step.