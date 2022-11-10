# create vpc name with stage
#.aws/credentials and config(region--it picks)
data "aws_availability_zones" "available" {
  state = "available"
}


resource "aws_vpc" "vpc" {
  cidr_block           = "10.1.0.0/16"
  instance_tenancy     = "default"
  enable_dns_hostnames = "true"


  tags = {
    Name      = "stage-vpc",
    Terraform = "True"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "Stage-igw"
  }
  depends_on = [
    aws_vpc.vpc
  ]
}