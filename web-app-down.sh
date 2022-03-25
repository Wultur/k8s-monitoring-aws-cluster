#!/usr/bin/env bash
echo "-------Deleting ConfigMap web-app-config-------"
kubectl delete configmap/web-app-config
echo "-------Deleting Service and Deployment-------"
kubectl delete -f ./web-app