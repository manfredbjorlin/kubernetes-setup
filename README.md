# Single Node

```mermaid
flowchart LR
A(k0s)
B[k0scli apply -f 00-k0sctl-configuration.yaml]
A-->B
C(k9s)
D[00-k3s-no-CNI.sh]
C-->D
E[01-k3s-export-kubeconfig.sh]
D-->E
F[02-cilium-download.sh]
B-->F
E-->F
G[03-cilium-install.sh]
F-->G
G-->H
H{Got external IP?}
I[kubectl apply -f 04-cilium-lb-pool.yaml]
J((Done))
H--No-->I
H--Yes-->J
I-->J
```

## k0s
- Download [k0scli](https://github.com/k0sproject/k0sctl)
- Run `k0scli apply -f 00-k0scli-configuration.yaml`
- run cilium download and install
- if `<pending>` EXTERNAL_IP run the cilium yaml - _IMPORTANT: edit to add correct ips_

## k3s
- run both k3s scripts
- run cilium download and install scripts
- if `<pending>` EXTERNAL_IP run the cilium yaml - _IMPORTANT: edit to add correct ips_
