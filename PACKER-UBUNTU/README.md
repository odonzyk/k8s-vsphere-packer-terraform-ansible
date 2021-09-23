build a ubuntu template on vpshere

You’ll need these files. The .json file is where you configure settings for Packer to build and provision the VM, connect to vSphere, and so on. 
The user-data and meta-data files are used for unattended installation of Ubuntu. Although only the user-data files contain information, both must be present. 
Packer uses these files and mounts them as CDROM’s to the vSphere guest VM.


❯ tree .  
.  
├── http  
│   ├── meta-data  
│   └── user-data  
└── ubuntu-2004.json  
└── post-script.sh  


The post-script.sh is needed, because it need some hack to get new IP's for all machines!

Also, you’ll need to upload an ISO to the vSphere datastore
I’ve uploaded the ISO already for you in vsphere ->  "iso_url": "[Youre Datastore] ISO/ubuntu-20.04.3-live-server-amd64.iso" ;-)

Generate Password
    You need to generate a password salted with SHA512. 
    Well, docker to the rescue! The below command works fine to generate the password with the help of docker.

    > docker run --rm -ti alpine:latest mkpasswd -m sha512
    Password: ?
    (Gives a Output with your encrpted password!)
    
    Edit the user-data file with the newly created password.

    The Labor ansible Key is also stored in user-data file!


packer build -force ubuntu-2004.json

cheers Oliver

