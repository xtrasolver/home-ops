talosctl apply-config --insecure --mode=interactive --nodes 192.168.21.10

talosctl kubeconfig --nodes 192.168.21.10

kubectl get nodes

$env:SIDERO_CONTROLLER_MANAGER_HOST_NETWORK        = "true"
$env:SIDERO_CONTROLLER_MANAGER_API_ENDPOINT        = "192.168.21.10"
$env:SIDERO_CONTROLLER_MANAGER_SIDEROLINK_ENDPOINT = "192.168.21.10"

clusterctl init -b talos -c talos -i sidero

kubectl apply -R -f .\sidero-metal

docker buildx create --use --platform linux/amd64 --platform linux/arm64

docker buildx build --platform linux/arm64 -t xtrasolver/rpi-serials:0.0.5 --push raspberrypi4-uefi

kubectl -n sidero-system scale deployment sidero-controller-manager --replicas 0

kubectl -n sidero-system patch deployments.apps sidero-controller-manager --patch-file scripts/patch.yaml

kubectl -n sidero-system scale deployment sidero-controller-manager --replicas 1


kubectl get talosconfig cluster-001-cp-bzs77 -o jsonpath='{.status.talosConfig}' > cluster-001-talosconfig.yaml


# kubectl create namespace argocd

# kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

