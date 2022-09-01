variable "region" {
  type        = string
  default     = "us-west-2"
  description = "Define the region you'd wish the cloudtrail resources to be created in, example: us-west-2"
}

variable "namespace" {
  type        = string
  description = "Define the namespace here, example: foobarinc-dev (projectname-environment)"
}
