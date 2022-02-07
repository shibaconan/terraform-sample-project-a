locals {
  # Use existing (via data source) or create new zone (will fail validation, if zone is not reachable)
  use_existing_route53_zone = true

  domain = "sample.com"

  # Removing trailing dot from domain - just to be sure :)
  domain_name = trimsuffix(local.domain, ".")
}

data "aws_route53_zone" "this" {
  count = local.use_existing_route53_zone ? 1 : 0

  name         = local.domain_name
  private_zone = false
}

resource "aws_route53_zone" "this" {
  count = !local.use_existing_route53_zone ? 1 : 0
  name  = local.domain_name
}

module "acm" {
  source  = "../../../modules/acm"

  domain_name = local.domain_name
  zone_id     = coalescelist(data.aws_route53_zone.this.*.zone_id, aws_route53_zone.this.*.zone_id)[0]

  subject_alternative_names = [
    "www.${local.domain_name}",
    "api.${local.domain_name}",
    "www.api.${local.domain_name}",
    "cms.${local.domain_name}",
    "www.cms.${local.domain_name}",
  ]

  wait_for_validation = true

  tags = {
    Name = local.domain_name
  }
}
