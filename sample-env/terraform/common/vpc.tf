module "vpc" {
  source = "../../../modules/vpc"

  #----- VPC -----#
  vpc_cidr_block           = "10.10.10.0/21"
  vpc_instance_tenancy     = "default"
  vpc_enable_dns_support   = "true"
  vpc_enable_dns_hostnames = "true"
  vpc_name                 = "sample-vpc"

  #----- VPC Internet Gateway -----#
  vpc_ig_name = "sample-igw"

  #----- VPC NAT Gateway -----#
  vpc_ngw_eip  = "eipalloc-XXXXXXXXXXXXXXXXX"
  vpc_ngw_name = "sample-ngw"

  #----- VPC Subnet -----#
  az_a = "ap-northeast-1a"
  az_c = "ap-northeast-1c"

  vpc_sub_pub_a_cidr_block        = "10.10.10.0/24"
  vpc_sub_pub_a_name              = "sample-sub-pub-a"

  vpc_sub_pri_a_cidr_block        = "10.10.10.1/24"
  vpc_sub_pri_a_name              = "sample-sub-pri-a"

  vpc_sub_pub_c_cidr_block        = "10.10.10.2/24"
  vpc_sub_pub_c_name              = "sample-sub-pub-c"

  vpc_sub_pri_c_cidr_block        = "10.10.10.3/24"
  vpc_sub_pri_c_name              = "sample-sub-pri-c"

  #----- VPC Route Table ---#
  vpc_rt_pub_name           = "sample-rt-pub"
  vpc_rt_pri_name           = "sample-rt-pri"

  vpc_rt_pub_routes = [
    {
      cidr_block = "0.0.0.0/0",
      gateway_id = module.vpc.vpc_ig_id
    },
    {
      cidr_block = "172.30.0.0/21",
      transit_gateway_id = "tgw-XXXXXXXXXXXXXXXXX"
    }
  ]

  vpc_rt_pri_routes = [
    {
      cidr_block     = "0.0.0.0/0",
      nat_gateway_id = module.vpc.vpc_ngw_id
    }
  ]
}
