# AWS access variables must be specified in variables file.
# Note! they should remain secret! => variables files are not checked in
variable "access_key" {}
variable "secret_key" {}

# SSH access specification
variable "ssh_key_name" {
  default = "kubernetes-access-key"
}
variable "ssh_public_key" {}
variable "ssh_private_key_path" {}

# region to start the cluster in
variable "region" {
  default = "eu-central-1"
}

# availability zones
variable "availability_zones" {
  # comma separated list of availability zones, no spaces should be used
  #  this list is later on split to iterate of the list of availbility zones
  #  => such a construct used, because Terraform, does not currently support
  #     list definition in variables, only string and map are supported types
  default = "eu-central-1a,eu-central-1b"
}

# Network settings
variable "vpc_properties" {
  default = {
    "cidr" = "172.19.0.0/16"
    "name" = "test-cluster"
  }
}


# available CoreOS AMI images to be used
# HVM based
variable "amis" {
  default = {
    eu-central-1 = "ami-8bed0be4"  # beta based CoreOS 991.1.0: https://coreos.com/releases/#991.1.0
    eu-west-1 = "ami-2a1fad59"
    ap-northeast-1 = "ami-02c9c86c"
    ap-southeast-1 = "ami-00a06963"
    ap-southeast-2 = "ami-949abdf7"
    us-gov-west-1 = "ami-e0b70b81"
    sa-east-1 = "ami-c40784a8"
    us-east-1 = "ami-7f3a0b15"
    us-west-1 = "ami-a8aedfc8"
    us-west-2 = "ami-4f00e32f"
  }
}

# instance types to use
#  m3.medium
#  t2.small
variable "master_instance_type" {
  default = "t2.small"
}

variable "worker_instance_type" {
  default = "m3.medium"
}

variable "master_volume_size" {
  default = 25
}

variable "worker_volume_size" {
  default = 250
}

