#!/usr/bin/env python3

import csv
import subprocess
import io
import json

def get_inventory():
  cmd = ["multipass", "list", "--format", "csv"]
  result = subprocess.run(cmd, capture_output=True, text=True)

  f = io.StringIO(result.stdout.strip())
  reader = csv.DictReader(f)
 
  inventory = {
   "lb_nodes":{"hosts": []},
   "master_nodes":{"hosts": []},
   "worker_nodes":{"hosts": []},
   "Nodes":{"children": ["master_nodes", "worker_nodes"]},
   "_meta": {"hostvars": {}}
   }  
  
  start_priority = 100
  step = 10

  priority_map = { node: start_priority - (i * step) for i, node in enumerate(inventory["lb_nodes"])}
 
  for row in reader:
     name = row["Name"]
     ip = row["IPv4"]

     if name.startswith("k8s-lb"):
        inventory["lb_nodes"]["hosts"].append(name)
     elif name.startswith("k8s-master"):
        inventory["master_nodes"]["hosts"].append(name)
     elif name.startswith("k8s-worker"):
        inventory["worker_nodes"]["hosts"].append(name)
     
     inventory["_meta"]["hostvars"][name] = {
       "ansible_host": ip,
       "ansible_user": "ubuntu"
  }

  start_priority = 100
  step = 10
  priority_map = { node: start_priority - (i * step) for i, node in enumerate(inventory["lb_nodes"]["hosts"])}
 
  for name in inventory["_meta"]["hostvars"]:
   if name.startswith("k8s-lb"):
     inventory["_meta"]["hostvars"][name]["ansible_group_priority"] = priority_map.get(name, 1)
     
     if inventory["_meta"]["hostvars"][name]["ansible_group_priority"] == 100:
        inventory["_meta"]["hostvars"][name]["keepalived_role"] = "Master"
     else:
        inventory["_meta"]["hostvars"][name]["keepalived_role"] = "Backup"  

  return inventory 

if __name__ == "__main__":
   inventory = get_inventory()
   print(json.dumps(inventory, indent=2))
   
   



