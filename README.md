# homelab-iac-ansible
Full homelab infrastructure using ansible
## Run through docker instructions
### Build image
```docker build -t ansible:latest .```
### Run image
```docker run -it --name=ansible ansible:latest```

### Handy one liner
```docker build -t ansible:latest . && docker image prune -f && docker rm ansible; docker run -it --name=ansible ansible:latest```

## Test connections
```ansible all -m ping --ask-vault-pass```
