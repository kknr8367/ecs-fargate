resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name
  tags   = var.tags
}
 
# resource "aws_s3_bucket_acl" "cslvacl" {
#   bucket = aws_s3_bucket.bucket.id
#   acl    = var.acl
# }
 
# resource "aws_s3_bucket_versioning" "terraform_state" {
#   bucket = aws_s3_bucket.bucket.id
 
#   versioning_configuration {
#     status = "Enabled"
#   }
# }