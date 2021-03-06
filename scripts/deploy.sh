echo "Deploying Keel"

kubectl apply -f /Users/$USER/Repositories/argocd/ArgoCD-1/keel/deployment.yaml
echo "Please wait 30 seconds for message - Keel deployment complete - so pods have time to be created."
sleep 30s

echo "Keel deployment complete."

echo "Deploying ArgoCD with test application"

kubectl create ns argocd

kubectl apply -f /Users/$USER/Repositories/argocd/ArgoCD-1/argocd-install.yaml -n argocd

kubectl create ns myapp

kubectl apply -f /Users/$USER/Repositories/argocd/ArgoCD-1/dev

kubectl apply -f /Users/$USER/Repositories/argocd/ArgoCD-1/application.yaml

# Allow pods to spin up before completing deployment and beginning login script.
echo "Please wait 30 seconds for message - ArgoCD deployment complete - so pods have time to be created."
sleep 30s

echo "ArgoCD deployment complete."

. /Users/$USER/Repositories/argocd/ArgoCD-1/scripts/login.sh