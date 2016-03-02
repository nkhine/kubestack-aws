variable "discovery_url" {}

variable "kube_version" {
  default = "v1.1.8"
}

variable "master_count" {
  default = 3
}

variable "worker_count" {
  default = 3
}
