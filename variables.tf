variable "region" {
  type        = string
  default     = "us-west-2"
  description = "Define the region you'd wish the cloudtrail resources to be created in, example: us-west-2"
}

variable "namespace" {
  type        = string
  default     = "dev"
  description = "Define the namespace here, example: dev, uat, prod"
}
