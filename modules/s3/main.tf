resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name
  tags   = var.tags
}
 
resource "aws_s3_bucket_acl" "cslvacl" {
  bucket = aws_s3_bucket.bucket.id
  acl    = var.acl
}
 
resource "aws_s3_bucket_versioning" "terraform_state" {
  bucket = aws_s3_bucket.bucket.id
 
  versioning_configuration {
    status = "Enabled"
  }
}
 
variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}
 
variable "acl" {
  description = "The canned ACL to apply"
  type        = string
  default     = "private"
}
 
variable "tags" {
  description = "A map of tags to assign to the bucket"
  type        = map(string)
  default     = {}
}
 