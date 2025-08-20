#!/bin/bash
set -e

# Start local registry
# docker run -d --restart=always -p 5001:5000 --name kind-registry registry:2 || true

# Attach registry to kind network if needed
# docker network connect kind kind-registry || true

# Create cluster
# kind create cluster --name multinode --config multi-node-with-registry.yaml

# Build & push sample app
docker build -t localhost:5001/sample-web:latest ./sample-web
docker push localhost:5001/sample-web:latest

# Deploy to cluster
kubectl apply -f webapp.yaml

# Wait for the pod to be ready
echo "⏳ Waiting for the pod to be ready..."
kubectl wait --for=condition=ready pod -l app=sample-web --timeout=120s

# Port-forward in the background
echo "🔗 Setting up port-forwarding in the background..."
#!/bin/bash

# Find the pod name dynamically
POD_NAME=$(kubectl get pods --no-headers -o custom-columns=":metadata.name" | grep ^sample-web | head -n 1)

# Port-forward to the pod
if [ -n "$POD_NAME" ]; then
  echo "🔗 Setting up port-forwarding for pod: $POD_NAME"
  kubectl port-forward "$POD_NAME" 8070:80 > /dev/null 2>&1 &
  echo "🎉 All set! Visit http://localhost:8070 to see your app."
else
  echo "❌ No pod found with name starting with 'sample-web'."
fi