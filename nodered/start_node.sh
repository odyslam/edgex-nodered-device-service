# Run with source ./find_lorank.sh before the node-red service to add the env variable
LORANK_IP=$(ssh -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null root@172.18.0.1 -p22222 "nslookup lorank8.local" | grep "192" | awk '{print $3}')
export LORANK_IP
echo "Enviromental Variable LORANK_IP is set: $LORANK_IP"
npm start -- --userDir /data
