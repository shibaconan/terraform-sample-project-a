
module "alb_route53_records" {
  source  = "../../../modules/route53/records"

  zone_name = keys(data.terraform_remote_state.common.outputs.route53_zone_zone_id_prod)[0]

  records = [
    {
      name    = ""
      type    = "A"
      alias   = {
        name  = module.alb.lb_dns_name
        zone_id = module.alb.lb_zone_id
      }
    },
    {
      name    = "www"
      type    = "CNAME"
      records = ["sample.com"]
      ttl     = "300"
    },
    {
      name    = "api"
      type    = "A"
      alias   = {
        name  = module.alb.lb_dns_name
        zone_id = module.alb.lb_zone_id
      }
    },
    {
      name    = "www.api"
      type    = "CNAME"
      records = ["api.sample.com"]
      ttl     = "300"
    },
    {
      name    = "cms"
      type    = "A"
      alias   = {
        name  = module.alb.lb_dns_name
        zone_id = module.alb.lb_zone_id
      }
    },
    {
      name    = "www.cms"
      type    = "CNAME"
      records = ["cms.sample.com"]
      ttl     = "300"
    },
  ]
}
