module "zones" {
  source  = "../../../modules/route53/zones"

  zones = {
    "sample.com" = {
      comment = "sample.com"
      tags = {
        env = "test"
      }
    }
  }
}

module "records" {
  source = "../../../modules/route53/records"

  zone_name = keys(module.zones.route53_zone_zone_id)[0]

  # delegated stg NS record
  records = [
    {
      name    = "www"
      type    = "NS"
      ttl     = 172800
      records   = [
        "ns-1000.awsdns-11.org",
        "ns-2000.awsdns-12.net",
        "ns-3000.awsdns-13.co.uk",
        "ns-4000.awsdns-14.com"
      ]
    },
    {
      name    = ""
      type    = "TXT"
      ttl     = 172800
      records   = [
        "google-site-verification=XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
      ]
    }
  ]

  depends_on = [module.zones]
}
