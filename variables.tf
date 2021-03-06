variable "tenancy_ocid" {
}

variable "region" {
}

variable "image" {
  default = "ocid1.image.oc1..aaaaaaaa5yxem7wzie34hi5km4qm2t754tsfxrjuefyjivebrxjad4jcj5oa"
}

variable "use_custom_name" { 
  default = 0 
} 

variable "cluster_name" { 
  default = "cluster" 
} 

variable "shape" {
  default = "BM.HPC2.36"
}

variable "ad" {
}

variable "bastion_ad" {
}

variable "ssh_public_key" {
}

variable "compartment_ocid" {
}

variable "vcn_subnet" {
  default = "172.16.0.0/16"
}

variable "public_subnet" {
  default = "172.16.16.0/24"
}

variable "private_subnet" {
  default = "172.16.0.0/20"
}

variable "ssh_cidr" { 
  default = "0.0.0.0/0"
}

variable "private" {
  default = true
}

variable "node_count" {
}

variable "boot_volume_size" { 
}

variable "filesystem" {
  default = "beegfs"
}

# if false, tcp will be used over non-RDMA NIC (NIC-0)
variable "use_beegfs_over_rdma" {
  default = true
}

# Number of Metadata servers to start (Default: 1) in the FS cluster of var.node_count
# If you want to override, set this to a value between 1 and var.node_count
# DO NOT SET THIS VALUE to 0
variable "metadata_node_count" {
  default = 1
}

# Number of Storage servers to start (Default: number of hosts) in the FS cluster of var.node_count
# A non-zero value will be ignored and beegfs storage server will be started on each node of the cluster
# If you want to override, set this to a value between 1 and var.node_count
# DO NOT SET THIS VALUE to 0
variable "storage_node_count" {
  default = -1
}

# Install io500 perf benchmark binaries
variable "io500" {
  default = false
}

variable "bastion_shape" {
  default = "VM.Standard2.1"
}

variable "bastion_image" {
  type = map(string)
  default = {
	"ap-melbourne-1"	=    "ocid1.image.oc1.ap-melbourne-1.aaaaaaaavpiybmiqoxcohpiih2gasjgqpsiyz4ggylyhhitmrmf3j2ycucrq"
	"ap-mumbai-1"		=    "ocid1.image.oc1.ap-mumbai-1.aaaaaaaarrsp6bazleeeghz6jcifatswozlqkoffzwxzbt2ilj2f65ngqi6a"
	"ap-osaka-1"		=    "ocid1.image.oc1.ap-osaka-1.aaaaaaaafa5rhs2n3dyuncddh5oynk6gisvotvcvch3e6xwplji7phwtbqqa"
	"ap-seoul-1"		=    "ocid1.image.oc1.ap-seoul-1.aaaaaaaadrnhec6655uedkshgcklewzikoqcwr65sevbu27z7vzagniihfha"
	"ap-sydney-1"		=    "ocid1.image.oc1.ap-sydney-1.aaaaaaaaplq4fjdnoooudaqwgzaidh6r3lp3xdhqulx454jivy33t53hokga"
	"ap-tokyo-1"		=    "ocid1.image.oc1.ap-tokyo-1.aaaaaaaa5mpgmnwqwacey5gvczawugmo3ldgrjqnleckmnsokrqytcfkzspa"
	"ca-toronto-1"		=    "ocid1.image.oc1.ca-toronto-1.aaaaaaaai25l5mqlzvhjzxvb5n4ullqu333bmalyyg3ki53vt24yn6ld7pra"
	"eu-amsterdam-1"	=    "ocid1.image.oc1.eu-amsterdam-1.aaaaaaaayd4knq4bdh23zqgatgjhoajiz3mx4fy3oy62e5f45ll7trwak5ga"
	"eu-frankfurt-1"	=    "ocid1.image.oc1.eu-frankfurt-1.aaaaaaaa4cmgko5la45jui5cuju7byv6dgnfnjbxhwqxaei3q4zjwlliptuq"
	"eu-zurich-1"		=    "ocid1.image.oc1.eu-zurich-1.aaaaaaaa4nwf5h6nl3u5cdauemg352itja6izecs7ol73z6jftsg4agpdsma"
	"me-jeddah-1"		=    "ocid1.image.oc1.me-jeddah-1.aaaaaaaazrvioeng7va7w4qsuqny4jtxbvnxlf5hu7g2twn6rcwdu35u4riq"
	"sa-saopaulo-1"		=    "ocid1.image.oc1.sa-saopaulo-1.aaaaaaaalfracz4kuew4yxvgydpnbitip6qsreaz7kpxlkr4p67ravvi4jnq"
	"uk-gov-london-1"	=    "ocid1.image.oc4.uk-gov-london-1.aaaaaaaaslh4pip7u6iopbpxujy2twi7diqrs6kfvqfhkl27esdadkqa76mq"
	"uk-london-1"		=    "ocid1.image.oc1.uk-london-1.aaaaaaaa2uwbd457cd2gtviihmxw7cqfmqcug4ahdg7ivgyzla25pgrn6soa"
	"us-ashburn-1"		=    "ocid1.image.oc1.iad.aaaaaaaavzjw65d6pngbghgrujb76r7zgh2s64bdl4afombrdocn4wdfrwdq"
	"us-langley-1"		=    "ocid1.image.oc2.us-langley-1.aaaaaaaauckkms7acrl6to3cuhmv6hfjqwlnoxzuzophaose7pi2sfk4dzna"
	"us-luke-1"		=    "ocid1.image.oc2.us-luke-1.aaaaaaaadxeycutztmvaeefvilc57lfqool2rlgl2r34juyu4jkbodx2xspq"
	"us-phoenix-1"		=    "ocid1.image.oc1.phx.aaaaaaaacy7j7ce45uckgt7nbahtsatih4brlsa2epp5nzgheccamdsea2yq"
	"ap-osaka-1"		=    "ocid1.image.oc1.ap-osaka-1.aaaaaaaa23apvyouh3fuiw7aqjo574zsmgdwtetato6uxgu7tct7y4uaqila"
  }
}

variable "custom_bastion_image" { 
  default = ""
} 

variable "use_marketplace_image" {
  default = 1
}

locals {
  image_id  = (var.use_marketplace_image ? local.mp_listing_resource_id : var.image)
}

variable "use_standard_image" { 
  default = 1
} 

variable "use_existing_vcn" {
  default = 0
}

variable "vcn_id" {
  default = ""
}

variable "bastion_subnet_id" {
  default = ""
}

variable "cluster_subnet_id" {
  default = ""
}


