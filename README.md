# ArgoCD

https://argo-cd.readthedocs.io/en/stable/getting_started/

1. Install Argo CD

- kubectl create namespace argocd
- kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

2. Download Argo CD CLI

- Download the latest Argo CD version from https://github.com/argoproj/argo-cd/releases/latest. More detailed installation instructions can be found via the CLI installation documentation.
- Also available in Mac, Linux and WSL Homebrew:
```
brew install argocd
```

3. Access The Argo CD API Server

- Port Forwarding:
```
kubectl port-forward svc/argocd-server -n argocd 8080:443
```

4. Login Using The CLI
- The initial username is 'admin'.
- The initial password for the admin account is auto-generated and stored as clear text in the field password in a secret named argocd-initial-admin-secret in your Argo CD installation namespace. You can simply retrieve this password using kubectl:
```
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
```
- For better readability, e.g. if you want to copy & paste the generated password, you can simply append && echo to above command, which will add a newline to the output.

- WARNING: You should delete the argocd-initial-admin-secret from the Argo CD namespace once you changed the password. The secret serves no other purpose than to store the initially generated password in clear and can safely be deleted at any time. It will be re-created on demand by Argo CD if a new admin password must be re-generated.


- You can change the password via user settings on Argo UI. Otherwise you can change the password using the command below via CLI:
```
argocd account update-password
```