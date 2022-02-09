# Blog API
Based on blog-api: https://github.com/olawalejarvis/blog_api_tutorial

## REQUIREMENTS
- Install Docker: https://docs.docker.com/get-docker/
- Install Minikube: https://minikube.sigs.k8s.io/docs/start/
- Install kubectl

## Deploying Postgres DB
```
  kubectl apply -f postgres-config.yaml
  kubectl apply -f postgres-secret.yaml
  kubectl apply -f postgres-storage.yaml
  kubectl apply -f postgres-deployment.yaml
  kubectl apply -f postgres-service.yaml
  
  The database can be accessed as following (password is docker)
  
  psql -h localhost -U docker --password -p 30015 docker
```

## Deploying the API

### Adding RBAC
```
  kubectl apply -f pod-reader.yaml
  kubectl apply -f pod-reader-binding.yaml
  kubectl apply -f secret-reader.yaml
  kubectl apply -f read-secrets-global.yaml
```
### Pushing the docker image and deploying it
```
  sudo docker build -t localhost:32000/api .
  sudo docker push localhost:32000/api

  kubectl apply -f api-deployment.yaml
  kubectl apply -f api-service.yaml
```

Use kubectl get svc to get the ClusterIP of the api

Test API connection using

curl -k $CLUSTER_IP:5000

## Deploying the API with Helm chart
```
  microk8s helm3 install ./helm-charts/rest-api-chart --generate-name
```

Execute the recommended commands to get the nodePort and nodeIP, then test the API connection by using
```
curl -k https://$NODE_IP:$NODE_PORT
```

## POSTS
- Part 1: https://www.codementor.io/olawalealadeusi896/restful-api-with-python-flask-framework-and-postgres-db-part-1-kbrwbygx5
- Part 2: https://www.codementor.io/olawalealadeusi896/building-a-restful-blog-apis-using-python-and-flask-part-2-l9y8awusp
- Part 3: https://www.codementor.io/olawalealadeusi896/building-a-restful-blog-apis-using-python-and-flask-part-3-lx7rt8pfk
