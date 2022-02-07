# Create VPC
resource "aws_vpc" "vpc-config" {
  cidr_block           = var.vpc_cidr_block
  instance_tenancy     = var.vpc_instance_tenancy
  enable_dns_support   = var.vpc_enable_dns_support
  enable_dns_hostnames = var.vpc_enable_dns_hostnames
  tags = merge(
    var.vpc_additional_tags,
    {
      Name = var.vpc_name
    }
  )
}

# Create Internet Gateway
resource "aws_internet_gateway" "vpc-ig-config" {
  vpc_id = aws_vpc.vpc-config.id
  tags = {
    Name = var.vpc_ig_name
  }
}

# Create NAT Gateway
resource "aws_nat_gateway" "vpc-ngw-config" {
  count = var.vpc_ngw_enabled ? 1 : 0
  allocation_id = var.vpc_ngw_eip
  subnet_id     = aws_subnet.vpc-sub-pub-a-config.id
  depends_on = [aws_internet_gateway.vpc-ig-config]
  tags = {
    Name = var.vpc_ngw_name
  }
}

# Create Subnet
resource "aws_subnet" "vpc-sub-pub-a-config" {
  vpc_id            = aws_vpc.vpc-config.id
  cidr_block        = var.vpc_sub_pub_a_cidr_block
  availability_zone = var.az_a
  tags = merge(
    var.vpc_public_subnet_tags,
    {
      Name = var.vpc_sub_pub_a_name
    }
  )
}

resource "aws_subnet" "vpc-sub-pri-a-config" {
  vpc_id            = aws_vpc.vpc-config.id
  cidr_block        = var.vpc_sub_pri_a_cidr_block
  availability_zone = var.az_a
  tags = merge(
    var.vpc_private_subnet_tags,
    {
      Name = var.vpc_sub_pri_a_name
    }
  )
}

resource "aws_subnet" "vpc-sub-pub-c-config" {
  vpc_id            = aws_vpc.vpc-config.id
  cidr_block        = var.vpc_sub_pub_c_cidr_block
  availability_zone = var.az_c
  tags = merge(
    var.vpc_public_subnet_tags,
    {
      Name = var.vpc_sub_pub_c_name
    }
  )
}

resource "aws_subnet" "vpc-sub-pri-c-config" {
  vpc_id            = aws_vpc.vpc-config.id
  cidr_block        = var.vpc_sub_pri_c_cidr_block
  availability_zone = var.az_c
  tags = merge(
    var.vpc_private_subnet_tags,
    {
      Name = var.vpc_sub_pri_c_name
    }
  )
}

# Create Route Table
resource "aws_route_table" "vpc-rt-pub-config" {
  vpc_id = aws_vpc.vpc-config.id
  dynamic "route" {
    for_each = var.vpc_rt_pub_routes
    content {
      cidr_block                = route.value.cidr_block
      gateway_id                = lookup(route.value, "gateway_id", null)
      transit_gateway_id        = lookup(route.value, "transit_gateway_id", null)
      vpc_peering_connection_id = lookup(route.value, "vpc_peering_connection_id", null)
    }
  }
  tags = {
    Name = var.vpc_rt_pub_name
  }
}

resource "aws_route_table" "vpc-rt-pri-config" {
  vpc_id = aws_vpc.vpc-config.id
  dynamic "route" {
    for_each = var.vpc_rt_pri_routes
    content {
      cidr_block                = route.value.cidr_block
      nat_gateway_id            = lookup(route.value, "nat_gateway_id", null)
      transit_gateway_id        = lookup(route.value, "transit_gateway_id", null)
      vpc_peering_connection_id = lookup(route.value, "vpc_peering_connection_id", null)
      network_interface_id      = lookup(route.value, "network_interface_id", null)
    }
  }
  tags = {
    Name = var.vpc_rt_pri_name
  }
}

# Create association between a subnet and routing table
resource "aws_route_table_association" "vpc-rt-association-pub-a" {
  subnet_id      = aws_subnet.vpc-sub-pub-a-config.id
  route_table_id = aws_route_table.vpc-rt-pub-config.id
}

resource "aws_route_table_association" "vpc-rt-association-pri-a" {
  subnet_id      = aws_subnet.vpc-sub-pri-a-config.id
  route_table_id = aws_route_table.vpc-rt-pri-config.id
}

resource "aws_route_table_association" "vpc-rt-association-pub-c" {
  subnet_id      = aws_subnet.vpc-sub-pub-c-config.id
  route_table_id = aws_route_table.vpc-rt-pub-config.id
}

resource "aws_route_table_association" "vpc-rt-association-pri-c" {
  subnet_id      = aws_subnet.vpc-sub-pri-c-config.id
  route_table_id = aws_route_table.vpc-rt-pri-config.id
}
