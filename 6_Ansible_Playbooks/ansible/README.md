

### ansible-playbook command line example
```
ansible -i inventory/hosts k8s_cluster -m ping
```

```
ansible-playbook -i inventory/hosts --extra-vars "host=minikube" playbooks/minikube-inst.yaml -kK

```
### step1 install k8s dependences on each nodes(master worker)
```
ansible-playbook -i inventory/hosts --limit k8s_cluster playbooks/k8s-cluster-init.yaml  -kK
```
### step2 init master node and join worker nodes
```
ansible-playbook -i inventory/hosts --extra-vars "master_host=k8s-master worker_host=k8s_worker" playbooks/k8s-node-init.yaml -kK
```