export KUBECONFIG="/home/kismath/CFA Insta/k8s-evalution/kubeconfig.yml"


kubectl delete pod -l 'app=node-redis-adeleke'
# kubectl delete deployment -l 'name=node-redis-adeleke'
# kubectl delete service -l 'name=node-redis-adeleke'


cd    redis/
kubectl apply -f service_redis_adeleke.yml
kubectl apply -f deployement_redis_adeleke.yml


cd    ../redis-react/
docker build -t redis-react .
docker tag  redis-react cloud.canister.io:5000/kadeleke/redis-react
docker login --username=kadeleke --password=Df4PecBST9Ry7R9 cloud.canister.io:5000
docker push cloud.canister.io:5000/kadeleke/redis-react
kubectl create secret docker-registry regcredadeleke --docker-server=cloud.canister.io:5000/kadeleke/redis-react --docker-username=kadeleke --docker-password=Df4PecBST9Ry7R9 --docker-email=adelekekismath9@gmail.com
cd    ../redis-react-deploy/
kubectl apply -f service_redis_react_adeleke.yml
kubectl apply -f deployement_redis_react_adeleke.yml

sleep 10

cd  ../node-redis/
kubectl apply -f service_node_redis_adeleke.yml
kubectl apply -f deployement_node_redis_adeleke.yml









