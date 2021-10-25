# ArgoCD

https://argo-cd.readthedocs.io/en/stable/getting_started/

1. Install Argo CD

- kubectl create namespace argocd
- kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

2. Download Argo CD CLI¶

- Download the latest Argo CD version from https://github.com/argoproj/argo-cd/releases/latest. More detailed installation instructions can be found via the CLI installation documentation.
- Also available in Mac, Linux and WSL Homebrew:
'''
brew install argocd
'''