variable "service" {
  type    = string
  default = "sample"
}

variable "env" {
    type = string
    default = "test"
}

#--------------------------------------------------------------------------------
# VPC
#--------------------------------------------------------------------------------
locals {
    vpc_cidr = data.terraform_remote_state.common.outputs.vpc_cidr

    vpc_private_subnet_ids = [
        data.terraform_remote_state.common.outputs.vpc_sub_pri_a_id,
        data.terraform_remote_state.common.outputs.vpc_sub_pri_c_id
    ]

    vpc_private_subnet_cidr_blocks = [
        data.terraform_remote_state.common.outputs.vpc_sub_pri_a_cidr_block,
        data.terraform_remote_state.common.outputs.vpc_sub_pri_c_cidr_block
    ]
}
