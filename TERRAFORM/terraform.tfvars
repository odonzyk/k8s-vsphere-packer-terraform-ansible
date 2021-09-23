# terraform.tfvars

# First we define how many controller nodes and worker nodes we want to deploy
control-count = "1"
worker-count = "3"

# VM Configuration
vm-prefix = "k8s"
vm-template-name = "vm/templates/ubuntu-packer-template"
vm-cpu = "2"
vm-ram = "4096"
vm-guest-id = "debian10_64Guest"

vm-datastore = "Your Datastore"
vm-network = "Your Network"
vm-domain = "Your Domain"

# vSphere configuration
vsphere-vcenter = "Your Url"
vsphere-unverified-ssl = "true"
vsphere-datacenter = "Your Datacenter"
vsphere-cluster = "Your Cluster"

vsphereuser = "Youre User"
vspherepass = "Youre Password"
