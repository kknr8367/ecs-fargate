resource "aws_vpc" "main" {
  cidr_block = var.cidr_block
  enable_dns_support = true
  enable_dns_hostnames = true
}

resource "aws_subnet" "public" {
  count = 2
  vpc_id = aws_vpc.main.id
  cidr_block = cidrsubnet(var.cidr_block, 8, count.index)
  map_public_ip_on_launch = true
}

resource "aws_subnet" "private" {
  count = 2
  vpc_id = aws_vpc.main.id
  cidr_block = cidrsubnet(var.cidr_block, 8, count.index + 2)
}