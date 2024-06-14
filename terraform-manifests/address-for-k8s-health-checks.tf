# Infrastructure for Yandex Virtual Private Cloud and Yandex Cloud DNS
#
# RU: https://yandex.cloud/ru/docs/managed-kubernetes/tutorials/custom-health-checks
# EN: https://yandex.cloud/en/docs/managed-kubernetes/tutorials/custom-health-checks

# Set the configuration of Cloud DNS
locals {
  domain_name = "" # Domain name with a full stop at the end. For example, "test.example-public.com."

  # The following settings are predefined. Change them only if necessary.
  zone_name       = "my-public-zone" # Name of the public DNS zone
  ip_address_name = "my-ip-address" # Name of the static public IP address
}

resource "yandex_vpc_address" "addr" {
  name = local.ip_address_name
  external_ipv4_address {
    zone_id = "ru-central1-a"
  }
}

resource "yandex_dns_zone" "zone1" {
  name        = local.zone_name
  description = "Public DNS zone"
  zone        = local.domain_name
  public      = true
}

resource "yandex_dns_recordset" "rs1" {
  zone_id = yandex_dns_zone.zone1.id
  name    = local.domain_name
  type    = "A"
  ttl     = 600
  data    = [yandex_vpc_address.addr.external_ipv4_address[0].address]
}
