chmod 0755 ./client/node_modules/.bin/jest
chmod +x ./client/node_modules/.bin/react-scripts
docker build -t atparte1/multi-client:latest -t atparte1/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t atparte1/multi-server:latest -t atparte1/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t atparte1/multi-worker:latest -t atparte1/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push atparte1/multi-client:latest
docker push atparte1/multi-server:latest
docker push atparte1/multi-worker:latest

docker push atparte1/multi-client:$SHA
docker push atparte1/multi-server:$SHA
docker push atparte1/multi-worker:$SHA

kubectl apply -f k8s

kubectl set image deployment/server-deployment server=atparte1/multi-server:$SHA
kubectl set image deployment/client-deployment client=atparte1/multi-client:$SHA
kubectl set image deployment/worker-deployment worker=atparte1/multi-worker:$SHA