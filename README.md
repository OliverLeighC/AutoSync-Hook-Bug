# Prereqs

Setup argocd on a cluster (I used minikube for this example)

# in `example-image` directory context

`docker compose up --build` will build the local docker registry and the migration image

then run `./push_image.sh` to tag and push the migration image to the registry
