# oci-beegfs-beeond
Deploy BeeGFS BeeOND (BeeGFS ON Demand) on Oracle Cloud Infrastructure HPC Clustered Network. The template will do the following: 

    1. Provision a private clustered network using HPC baremeta nodes and 100 Gbps RDMA.  Use this template to deploy BeeGFS BeeOND on HPC nodes with clustered networking.   

    2. Create a BeeGFS BeeOND parallel filesystem using all the nodes in the cluster by leveraging the local NVMe SSD on each HPC node to create a single filesystem namespace.

    3. By default, the filesystem is designed to use 100Gbps RDMA for filesystem traffic along with your compute application traffic.  If we want to use 100Gbps RDMA only for your compute application traffic, then you can configure BeeOND to use 25Gbps network on the HPC nodes.      

