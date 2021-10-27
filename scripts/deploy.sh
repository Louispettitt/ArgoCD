kubectl create ns argocd

kubectl apply -f /Users/$USER/Repositories/argocd/ArgoCD-1/argocd-install.yaml -n argocd

kubectl create ns myapp

kubectl apply -f /Users/$USER/Repositories/argocd/ArgoCD-1/dev

kubectl apply -f /Users/$USER/Repositories/argocd/ArgoCD-1/application.yaml

echo "Deployment complete."