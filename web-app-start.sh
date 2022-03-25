#!/usr/bin/env bash
echo "-------Creating ConfigMap from directory conf-------"
kubectl create configmap web-app-config --from-file=./conf
echo "-------Creating Service and Deployment-------"
kubectl apply -f ./web-app