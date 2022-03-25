#!/usr/bin/env bash

echo "-------Issuer crd delete-------"
kubectl delete -f issuer.yaml

echo "-------Cert-manager uninstall-------"
kubectl delete -f https://github.com/cert-manager/cert-manager/releases/download/v1.7.1/cert-manager.yaml

echo "-------NGINX Ingress Controllet uninstall-------"
helm uninstall ingress-nginx --namespace ingress-nginx

echo "-------Loki uninstall-------"
helm uninstall loki --namespace monitoring

echo "-------Prometheus uninstall-------"
helm uninstall prometheus --namespace monitoring

sleep 30

echo "-------Deleting cluster k8s-web-------"
eksctl delete cluster --region=eu-north-1 --name=k8s-web