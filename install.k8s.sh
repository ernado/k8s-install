#!/bin/bash

set -e
set -x

kubeadm init --skip-phases=addon/kube-proxy \
  --pod-network-cidr=10.244.0.0/16 \
  --service-cidr=10.96.0.0/16

rm -rf /root/.kube
mkdir -p /root/.kube
cp -i /etc/kubernetes/admin.conf /root/.kube/config
chown $(id -u):$(id -g) /root/.kube/config

kubectl taint nodes --all node-role.kubernetes.io/control-plane-

kubectl apply -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/main/example/prometheus-operator-crd/monitoring.coreos.com_servicemonitors.yaml
helm upgrade --version 1.13.2 --install --create-namespace --namespace "cilium" cilium cilium/cilium --values cilium.yml

cilium -n cilium status --wait
