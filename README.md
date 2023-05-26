Exportez la variable d'environnement KUBECONFIG pour spécifier le chemin vers votre fichier kubeconfig.yml :
```SH
export KUBECONFIG="/home/kismath/CFA Insta/k8s-evalution/kubeconfig.yml"
```

Supprimez le pod Redis existant à l'aide de la commande suivante :
```SH
kubectl delete pod -l 'app=node-redis-adeleke'
```

Accédez au répertoire "redis/" :
```SH
cd    redis/

Appliquez le fichier YAML pour le service et le deploiement Redis :
```SH
kubectl create -f service_redis_adeleke.yml
kubectl create -f deployement_redis_adeleke.yml
```

```SH
cd    ../redis-react/
```
Construisez l'image Docker pour l'application Redis-React :
```SH
docker build -t redis-react .
```

Étiquetez l'image Docker avec le bon référentiel :
```SH
docker tag  redis-react cloud.canister.io:5000/kadeleke/redis-react
```
Connectez-vous au registre Docker cloud.canister.io:5000 et poussez l'image Docker vers le registre :
```SH
docker login --username=kadeleke --password=Df4PecBST9Ry7R9 cloud.canister.io:5000
docker push cloud.canister.io:5000/kadeleke/redis-react
```
Créez un secret Docker-Registry pour accéder à l'image dans Kubernetes
```SH
kubectl create secret docker-registry regcredadeleke --docker-server=cloud.canister.io:5000/kadeleke/redis-react --docker-username=kadeleke --docker-password=Df4PecBST9Ry7R9 --docker-email=adelekekismath9@gmail.com
```
```SH
cd    ../redis-react-deploy/
```
Appliquez le fichier YAML pour le service et le deploiement Redis-React 
```SH
kubectl create -f service_redis_react_adeleke.yml
kubectl create -f deployement_redis_react_adeleke.yml
```

attendre quelque secoonde pour s'assurer que toutes les commandes ont été lancé
```SH
sleep 10
```

cd  ../node-redis/
Appliquez le fichier YAML pour le service et le deploiement node-redis
```SH
kubectl apply -f service_node_redis_adeleke.yml
kubectl apply -f deployement_node_redis_adeleke.yml
```

Pour pouvoir accéder au site du redis-react, lancer le external-IP du service correspondant, moi je n'ai pas réussir à le faire car j'ai eu une erreur 404










