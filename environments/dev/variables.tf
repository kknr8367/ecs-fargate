variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}
 
variable "bucket_name" {
  description = "Name of the S3 bucket for Terraform state"
  type        = string
  default     = "mxu-np-lv-sqlserver-backuprestore1"
}
 
variable "dynamodb_table_name" {
  description = "Name of the DynamoDB table for state locking"
  type        = string
  default     = "terraform-state-lock-dev"
}
 
variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}
variable "project" {
  description = "Environment name"
  type        = string
  default     = "Crop Science LabVantage"
}

variable "acl" {
  description = "The canned ACL to apply"
  type        = string
  default     = "private"
}
 