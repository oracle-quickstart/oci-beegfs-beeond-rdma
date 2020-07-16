[bastion]
${bastion_name} ansible_host=${bastion_ip} ansible_user=opc role=bastion
[compute]
%{ for host, ip in compute ~}
${host} ansible_host=${ip} ansible_user=opc role=compute
%{ endfor ~}
[all:children]
bastion
compute
[all:vars]
ansible_connection=ssh
ansible_user=opc
rdma_network=192.168.168.0
rdma_netmask=255.255.252.0
public_subnet=${public_subnet} 
private_subnet=${private_subnet}
nvme_path=/mnt/localdisk/
filesystem=${filesystem}
use_beegfs_over_rdma=${use_beegfs_over_rdma}
metadata_node_count=${metadata_node_count}
storage_node_count=${storage_node_count}
nodefile_rdma=/home/opc/nodefile.rdma
nodefile_tcp=/home/opc/nodefile.tcp
beeond_mount=/mnt/beeond
io500=${io500}

