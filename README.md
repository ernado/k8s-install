# k8s install

This was used to create go-faster k8s cluster.

## Setup

1. Change `k8sServiceHost` in `cilium.yml` to your control node IP
2. Read [install.k8s.sh](install.k8s.sh) and run it

### Metallb

There is an example of single-address metallb pool, see [metallb.sh](metallb.sh), [metallb.ns.yml](metallb.ns.yml), [ap.mb.yml](ap.mb.yml)

### OpenEBS

There is an example of local SSD storage, see [openebs.sh](openebs.sh), [openebs.storageclass.yml](openebs.storageclass.yml), [openebs.yml](openebs.yml)