#!/bin/bash

helm upgrade --install --create-namespace --namespace metallb metallb metallb/metallb
kubectl apply -f ap.mb.yml