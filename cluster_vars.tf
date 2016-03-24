variable "discovery_url" {}

# kubernetes release version, as stated at: https://github.com/kubernetes/kubernetes/releases
#  e.g. v1.1.8 or v1.2.0-beta.0
#  releases:
#  v1.1.7
#  v1.1.8
#  v1.2.0-beta.0
#  v1.2.0-beta.1
#  v1.2.0
variable "kube_version" {
  default = "v1.2.0"
}

variable "master_count" {
  default = 3
}

variable "worker_count" {
  default = 3
}

################
# Tags which need to specified
# kubernetes cluster ID, it must be unique for every new cluster
variable "kubernetes_cluster_id" {}
variable "system" {}


