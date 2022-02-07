#----- VPC -----#
output "vpc_id" {
  value = aws_vpc.vpc-config.id
}

output "vpc_cidr" {
  value = aws_vpc.vpc-config.cidr_block
}

#----- VPC Internet Gateway -----#
output "vpc_ig_id" {
  value = aws_internet_gateway.vpc-ig-config.id
}

#----- VPC NAT Gateway -----#
output "vpc_ngw_id" {
  value = length(aws_nat_gateway.vpc-ngw-config) == 0 ? null : aws_nat_gateway.vpc-ngw-config.0.id
}

#----- VPC Subnet -----#
output "vpc_sub_pub_a_id" {
  value = aws_subnet.vpc-sub-pub-a-config.id
}

output "vpc_sub_pub_a_cidr_block" {
  value = aws_subnet.vpc-sub-pub-a-config.cidr_block
}

output "vpc_sub_pri_a_id" {
  value = aws_subnet.vpc-sub-pri-a-config.id
}

output "vpc_sub_pri_a_cidr_block" {
  value = aws_subnet.vpc-sub-pri-a-config.cidr_block
}

output "vpc_sub_pub_c_id" {
  value = aws_subnet.vpc-sub-pub-c-config.id
}

output "vpc_sub_pub_c_cidr_block" {
  value = aws_subnet.vpc-sub-pub-c-config.cidr_block
}

output "vpc_sub_pri_c_id" {
  value = aws_subnet.vpc-sub-pri-c-config.id
}

output "vpc_sub_pri_c_cidr_block" {
  value = aws_subnet.vpc-sub-pri-c-config.cidr_block
}

#----- VPC Route Table ---#
output "vpc_rt_pub_id" {
  value = aws_route_table.vpc-rt-pub-config.id
}

output "vpc_rt_pri_id" {
  value = aws_route_table.vpc-rt-pri-config.id
}
