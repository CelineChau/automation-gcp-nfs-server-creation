# define GCP project name
variable "gcp_project" {
  type        = string
  description = "GCP project name"
  default = "sandbox-cchau"
}

variable "gcp_region" {
  type        = string
  description = "GCP region"
  default = "europe-west1"
}