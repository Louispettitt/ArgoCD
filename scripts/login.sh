# Gets temporary password. The seret will be deleted once printed out.
echo "USERNAME = admin"
echo "Copy temporary password to use for login"
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d && echo
sleep 1s
echo "Deleting initial admin password"
kubectl -n argocd delete secret argocd-initial-admin-secret

sleep 5s

echo "Accessing ArgoCD UI."
kubectl port-forward svc/argocd-server -n argocd 8080:443

sleep 5s

open http://127.0.0.1:8080

#WARNING: You should delete the argocd-initial-admin-secret from the Argo CD namespace once you changed the password. 
#The secret serves no other purpose than to store the initially generated password in clear and can safely be deleted at any time. 
#It will be re-created on demand by Argo CD if a new admin password must be re-generated.
