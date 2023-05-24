kubectl label nodes go-faster-k8s-w-1 go-faster-k8s-w-2 go-faster-k8s-w-3 storage=ssd
helm install openebs --namespace openebs openebs/openebs --create-namespace --values openebs.yml
kubectl -n openebs apply -f openebs.storageclass.yml
