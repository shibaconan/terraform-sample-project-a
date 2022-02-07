#----- VPC -----#
output "vpc_id" {
  value = module.vpc.vpc_id
}

output "vpc_cidr" {
  value = module.vpc.vpc_cidr
}

#----- VPC Internet Gateway -----#
output "vpc_ig_id" {
  value = module.vpc.vpc_ig_id
}

#----- VPC NAT Gateway -----#
output "vpc_ngw_id" {
  value = module.vpc.vpc_ngw_id
}

#----- VPC Subnet -----#
output "vpc_sub_pub_a_id" {
  value = module.vpc.vpc_sub_pub_a_id
}

output "vpc_sub_pub_a_cidr_block" {
  value = module.vpc.vpc_sub_pub_a_cidr_block
}

output "vpc_sub_pri_a_id" {
  value = module.vpc.vpc_sub_pri_a_id
}

output "vpc_sub_pri_a_cidr_block" {
  value = module.vpc.vpc_sub_pri_a_cidr_block
}

output "vpc_sub_pub_c_id" {
  value = module.vpc.vpc_sub_pub_c_id
}

output "vpc_sub_pub_c_cidr_block" {
  value = module.vpc.vpc_sub_pub_c_cidr_block
}

output "vpc_sub_pri_c_id" {
  value = module.vpc.vpc_sub_pri_c_id
}

output "vpc_sub_pri_c_cidr_block" {
  value = module.vpc.vpc_sub_pri_c_cidr_block
}

#----- VPC Route Table ---#
output "vpc_rt_pub_id" {
  value = module.vpc.vpc_rt_pub_id
}

output "vpc_rt_pri_id" {
  value = module.vpc.vpc_rt_pri_id
}

#----- Security Group ---#
output "sg_work_id" {
  value = aws_security_group.sg-work-config.id
}

output "sg_ope_id" {
  value = aws_security_group.sg-ope-config.id
}

#----- EC2 Instance ---#
output "ec2_ope_id" {
  value = module.ec2-ope.ec2_id
}

output "ec2_ope_private_ip" {
  value = module.ec2-ope.ec2_private_ip
}

output "ec2_ope_subnet_id" {
  value = module.ec2-ope.ec2_subnet_id
}

#----- IAM -----#
output "iam_ec2_role_instance_profile" {
  value = aws_iam_instance_profile.sample-ec2-role-instance-profile.name
}

#----- Route53 -----#
output "route53_zone_zone_id_prod" {
  description = "Zone ID of Route53 zone"
  value       = module.zones.route53_zone_zone_id
}

output "route53_zone_name_servers_prod" {
  description = "Name servers of Route53 zone"
  value       = module.zones.route53_zone_name_servers
}

output "route53_zone_name_prod" {
  description = "Name of Route53 zone"
  value       = module.zones.route53_zone_name
}

# records
#output "route53_record_name" {
#  description = "The name of the record"
#  value       = module.records.route53_record_name
#}
#
#output "route53_record_fqdn" {
#  description = "FQDN built using the zone domain and name"
#  value       = module.records.route53_record_fqdn
#}

output "acm_certificate_arn" {
  description = "The ARN of the certificate"
  value       = module.acm.acm_certificate_arn
}

output "acm_certificate_domain_validation_options" {
  description = "A list of attributes to feed into other resources to complete certificate validation. Can have more than one element, e.g. if SANs are defined. Only set if DNS-validation was used."
  value       = module.acm.acm_certificate_domain_validation_options
}

output "acm_certificate_validation_emails" {
  description = "A list of addresses that received a validation E-Mail. Only set if EMAIL-validation was used."
  value       = module.acm.acm_certificate_validation_emails
}

output "validation_route53_record_fqdns" {
  description = "List of FQDNs built using the zone domain and name."
  value       = module.acm.validation_route53_record_fqdns
}

output "distinct_domain_names" {
  description = "List of distinct domains names used for the validation."
  value       = module.acm.distinct_domain_names
}

output "validation_domains" {
  description = "List of distinct domain validation options. This is useful if subject alternative names contain wildcards."
  value       = module.acm.validation_domains
}
