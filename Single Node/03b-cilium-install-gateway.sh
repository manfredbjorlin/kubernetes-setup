#!/bin/bash

echo "This is not 100% correct. This script will be updated"

API_SERVER_IP=`hostname -I`
API_SERVER_PORT=6443
POD_CIDR="10.42.0.0/16"
cilium install \
  --version 1.18.4 \
  --set ingressController.enabled=false \
  --set k8sServiceHost=${API_SERVER_IP} \
  --set k8sServicePort=${API_SERVER_PORT} \
  --set ipam.operator.clusterPoolIPv4PodCIDRList=$POD_CIDR \
  --set kubeProxyReplacement=true \
  --set gatewayAPI.enabled=true \
  --set gatewayAPI.hostNetwork.enabled=true \
  --set envoy.securityContext.capabilities.keepCapNetBindService=true \
  --set envoy.securityContext.runAsUser=0 \
  --set envoy.securityContext.runAsGroup=0 \
  --set envoy.securityContext.allowPrivilegeEscalation=true \
  --helm-set=operator.replicas=1