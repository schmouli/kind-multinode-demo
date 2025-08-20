# kind-multinode-demo

A demo project to set up a multi-node Kubernetes cluster using [kind](https://kind.sigs.k8s.io/).

## Prerequisites

- [Docker](https://docs.docker.com/get-docker/)
- [kind](https://kind.sigs.k8s.io/docs/user/quick-start/)
- [kubectl](https://kubernetes.io/docs/tasks/tools/)

## Usage

1. Clone this repository:
    ```sh
    git clone https://github.com/yourusername/kind-multinode-demo.git
    cd kind-multinode-demo
    ```

2. Create a multi-node cluster:
    ```sh
    kind create cluster --config=kind-config.yaml
    ```

3. Check the nodes:
    ```sh
    kubectl get nodes
    ```

## Cleanup

To delete the cluster:
```sh
kind delete cluster
```

## Resources

- [kind documentation](https://kind.sigs.k8s.io/docs/)
- [Kubernetes documentation](https://kubernetes.io/docs/)
