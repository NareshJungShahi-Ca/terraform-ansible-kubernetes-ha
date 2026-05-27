#!/usr/bin/env bash

set -euo pipefail

MASTER_NODE="k8s-master-0"
CONTROLPLANE_NAME="controlplane"   
HOSTS_TEMPLATE="/etc/cloud/templates/hosts.debian.tmpl"

echo "Checking Multipass instances..."

# Start all stopped instances
if multipass list --format csv | tail -n +2 | grep -qi "stopped"; then
  echo "Starting all instances..."
  multipass start --all
else
  echo "All instances are already running."
fi 

echo "Getting current master IP..."

MASTER_IP=$(multipass info "$MASTER_NODE" --format json | jq -r ".info.\"$MASTER_NODE\".ipv4[0]")

if [[ -z "$MASTER_IP" || "$MASTER_IP" == "null" ]]; then
  echo "ERROR: Could not get IP address for $MASTER_NODE"
  exit 1
fi

echo "$MASTER_NODE current IP: $MASTER_IP"

echo "Updating controlplane mapping on all nodes..."

for NODE in $(multipass list --format csv | tail -n +2 | cut -d',' -f1); do
  echo "Updating $NODE..."

  multipass exec "$NODE" -- sudo sed -i "/[[:space:]]$CONTROLPLANE_NAME$/d" "$HOSTS_TEMPLATE"

  multipass exec "$NODE" -- bash -c "echo '$MASTER_IP $CONTROLPLANE_NAME' | sudo tee -a '$HOSTS_TEMPLATE' >/dev/null"

  multipass exec "$NODE" -- sudo cloud-init single --name update_etc_hosts

  echo "Restarting kubelet on $NODE..."
  multipass exec "$NODE" -- sudo systemctl restart kubelet
done


echo "Done."
echo "controlplane -> $MASTER_IP"
echo ""
echo "SSH to master:"
echo "multipass shell $MASTER_NODE"
