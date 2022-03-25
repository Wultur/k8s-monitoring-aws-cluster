#!/usr/bin/env bash

echo "-------Creating cluster k8s-web-------"
eksctl create cluster -f k8s-web-cluster.yaml

sleep 60

echo "-------Prometheus stack install using Helm-------"
helm install prometheus \
prometheus-community/kube-prometheus-stack \
--version 34.1.0 \
--values prometheus-values.yaml \
--namespace monitoring \
--create-namespace

sleep 60

echo "-------Loki stack install using Helm-------"
helm install loki \
grafana/loki-stack \
--version 2.6.1 \
--values loki-values.yaml \
--namespace monitoring

echo "-------Ingress nginx controller install using Helm-------"
helm install ingress-nginx \
  ingress-nginx/ingress-nginx \
  --version 4.0.18 \
  --values ingress-values.yaml \
  --namespace ingress-nginx --create-namespace

echo "-------Cert manager install-------"
kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.7.1/cert-manager.yaml

sleep 30

kubectl apply -f issuer.yaml