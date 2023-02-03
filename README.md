# automation-gcp-nfs-server-creation

## Prerequisites
[Install packer](https://developer.hashicorp.com/packer/tutorials/docker-get-started/get-started-install-cli)

## Packer `./packer`
The packer folder contains a packer template to create a GCP custom image that runs a bash script. The script sets up the nfs server.


## Terraform `./terraform`
The terraform folder contains the terraform template to deploy a ubuntu VM, with an additional disk using the custom image created above, in GCP.
A startup script is running at the VM boot, to mount the additional disk.