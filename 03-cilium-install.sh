#!/bin/bash

API_SERVER_IP=`hostname -I`
API_SERVER_PORT=6443
POD_CIDR="10.42.0.0/16"
cilium install \
  --version 1.18.4 \
  --set ingressController.enabled=true \
  --set ingressController.loadbalancerMode=shared \
  --set ingressController.default=true \
  --set k8sServiceHost=${API_SERVER_IP} \
  --set k8sServicePort=${API_SERVER_PORT} \
  --set ipam.operator.clusterPoolIPv4PodCIDRList=$POD_CIDR \
  --set kubeProxyReplacement=true \
  --helm-set=operator.replicas=1
