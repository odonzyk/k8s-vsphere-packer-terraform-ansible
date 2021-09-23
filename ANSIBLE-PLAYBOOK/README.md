

1) First start in Terraform the creation of all need Master and Worker nodes.
   Terraform use a existing template vm from vpshere "template-terraform-ubuntu1", with stored ansible key, vsphere-guest-tools etc.
   Important, the template needs to be a thin-provision HardDisk and /etc/machine-id file needs to be empty after you convert to a template,
   in otherwise you have problems with new ip's!

root@lab-jump:/ADMIN-TOOLS/TERRAFORM/K8s# terraform plan
root@lab-jump:/ADMIN-TOOLS/TERRAFORM/K8s# terraform apply (with yes)

After that cou get no output of IP's but can get it our from vsphere frontend and change it in the k8shosts.yaml (the working-folder inventory)file !
  Of yourse it will be easier to have a dynmic-DNS inventoy with Labels or implemnt the ansible playbook directly into terraform as provisionier to use the ip's ;-)
  It the next task / issue for todo ;-)


Check with ansible that all machines are reachable
 ansible -i ../inventories/labor/k8hosts.yaml all -m ping

2) Start the ansible playbooks in that order with: ansible-playbook -i k8hosts.yaml install_all.yml

  1. root@lab-jump:/ADMIN-TOOLS/ANSIBLE/playbooks-Kubernetes#    ansible-playbook -i k8hosts.yaml users.yml
  2. root@lab-jump:/ADMIN-TOOLS/ANSIBLE/playbooks-Kubernetes#    ansible-playbook -i k8hosts.yaml install-k8s.yml
  3. root@lab-jump:/ADMIN-TOOLS/ANSIBLE/playbooks-Kubernetes#    ansible-playbook -i k8hosts.yaml master.yml
  4. root@lab-jump:/ADMIN-TOOLS/ANSIBLE/playbooks-Kubernetes#    ansible-playbook -i k8hosts.yaml join-workers.yml

If any goes wrong you can start again to reset all Masters and continue with step 3. To reset the next lines.
Master can only be started once, for more try, it need to be reset before with:
root@lab-jump:/ADMIN-TOOLS/ANSIBLE/playbooks-Kubernetes#    ansible-playbook -i k8hosts.yaml resetk8s.yml

Usage of the cluster and the kubectl command
If the cluster installed you need to switch to the right user with:

su kube

then you can work with the powerfull command like:

kubectl get all

Have fun!
