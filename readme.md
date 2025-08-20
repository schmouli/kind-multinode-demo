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
    kind create cluster --name multinode --config multi-node-with-registry.yaml
```

3. Build and Push the Docker Image
The setup.sh script automates the process of building the Docker image, pushing it to the local registry, and deploying the app to the cluster
 ```sh
    bash setup.sh
 ```

4. Access the Application
Once the setup is complete, the application will be accessible at http://localhost:8070.

5. Verify the Deployment
Check the pods:
 ```sh
    kubectl get pods
 ```
Check the service:
 ```sh
    kubectl get svc
 ```

Application Details
The application is a simple Flask web app with the following endpoints:

/: Returns a welcome message.
/health: Returns a health check response (OK).
Flask Application Code (app.py)
 ```sh
    from flask import Flask

    app = Flask(__name__)

    @app.route("/")
    def home():
        return "<h1>Hello from My own Kind Multi‑Node Cluster 🚀</h1>"

    @app.route("/health")
    def health():
        return "OK", 200

    if __name__ == "__main__":
        app.run(host="0.0.0.0", port=80)

 ```

Cleanup
To delete the Kind cluster:
 ```sh
    kind delete cluster --name multinode
 ```

## Resources

- [kind documentation](https://kind.sigs.k8s.io/docs/)
- [Kubernetes documentation](https://kubernetes.io/docs/)

License
This project is licensed under the MIT License.

Contributing
Feel free to open issues or submit pull requests for improvements or bug fixes.

Enjoy deploying your app on a Kind multi-node cluster! 🚀