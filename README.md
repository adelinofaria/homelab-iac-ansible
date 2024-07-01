# homelab-iac-ansible
Full homelab infrastructure using ansible
## Requisites
- A node with Proxmox VE installed - described in ```inventory/hosts``` as ```pve01```
- Control node with shh & python & ansible installed
## First time setup steps
1. generate your own ssh key at ./ssh-keys
    1. ```ssh-keygen -f homelab```
2. Add the recently generated key to ssh-agent
    1. ```ssh-add ssh-keys/homelab```
3. Setup your own vault for  ```pve01```
    1. ```ansible-vault create inventory/host_vars/pve01/vault```
    2. Add the following line to the file and save ```vault_api_password: <your own password>```
## Playbooks
### Create infrastructure
```
ansible-playbook main.yml -i inventory
```
### Modify infrastructure
This will update container configs on all managed nodes.
```
ansible-playbook edit.yml -i inventory
```
### Delete infrastructure
This will delete all managed nodes.
```
ansible-playbook nuke.yml -i inventory
```
### Report whole infrastructure
```
ansible-playbook csv_export.yml -i inventory
```
## Run through docker instructions
### Build image
```docker build -t ansible:latest .```
### Run image
```docker run -it --name=ansible ansible:latest```

### Handy one liner
```docker build -t ansible:latest . && docker image prune -f && docker rm ansible; docker run -it --name=ansible ansible:latest```

## Test connections
```ansible all -m ping```
