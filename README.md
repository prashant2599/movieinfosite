# Deploy Application on Minikube with Deployment, ClusterIP Service, and Ingress

This guide demonstrates how to deploy an application on Minikube using Kubernetes resources: Deployment, ClusterIP Service, and Ingress. We will set up an Stateless application, expose it internally using a ClusterIP service, and route traffic using an Ingress.

## Prerequisites

- **Minikube** installed ([Installation Guide](https://minikube.sigs.k8s.io/docs/start/))
- **kubectl** installed ([Installation Guide](https://kubernetes.io/docs/tasks/tools/install-kubectl/))

For detailed step-by-step instructions and explanations, please refer to my accompanying blog post.

# API URL
API_URL="https://api.themoviedb.org/3/movie/popular?api_key=b80142a02dfb0192723eeffdfdd9d7a5"
API_IMG="https://image.tmdb.org/t/p/w500/"
API_SEARCH="https://api.themoviedb.org/3/search/movie?api_key=b80142a02dfb0192723eeffdfdd9d7a5&query"
https://image.tmdb.org/t/p/w500


