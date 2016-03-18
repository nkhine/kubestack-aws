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
  default = "eu-central-1a,eu-central-1b"
}

# available CoreOS AMI images to be used
variable "amis" {
  default = {
    eu-central-1 = "ami-1807e377"  # beta based CoreOS Linux, currently features many security fixes
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
