#provider "oci" {
#tenancy_ocid     = "${var.tenancy_ocid}"
#user_ocid        = "${var.user_ocid}"
#fingerprint      = "${var.fingerprint}"
#private_key_path = "${var.private_key_path}"
#region           = "${var.region}"
#}


provider "oci" {
  version          = ">= 3.0.0"
  tenancy_ocid     = "${var.tenancy_ocid}"
  user_ocid        = "${var.user_ocid}"
  fingerprint      = "${var.fingerprint}"
  private_key_path = "${var.private_key_path}"
  region           = "${var.region}"
}

# Variables required by the OCI Provider only when running Terraform CLI with standard user based Authentication
variable "user_ocid" {
}

variable "fingerprint" {
}

variable "private_key_path" {
}

variable "ssh_private_key" {
}

variable "ssh_private_key_path" {
}
