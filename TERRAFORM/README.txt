K8s Folder is to create a count of VM's that can be use for Ansible installations
Here is used the ready vsphere vm template "template-terraform-ubuntu1" !
To start the process write:

terraform plan
terraform apply (-y)

The Result will showing no IP, thats right because:
After the vm starts, WAIT!, because the new vm will be restart by self to get an new IP via DHCP, that needs ca. 1-3 Minutes!
DO not running next steps with ansible if the vm's have not get his new IP's!

If you want delete the entire installations use:
terraform destroy
And don't forget to delete the entry's of $root/.ssh/known_hosts, because if you build new maschines it will be give conflicts.
Be carefull don't delete the bothe .tfstate files, because there is needed by terryform for destroy process or following runnings with changes!
