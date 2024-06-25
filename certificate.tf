resource "tls_private_key" "this" {
  count       = length(var.tls_private_key)
  algorithm   = lookup(var.tls_private_key[count.index], "algorithm")
  ecdsa_curve = lookup(var.tls_private_key[count.index], "ecdsa_curve")
  rsa_bits    = lookup(var.tls_private_key[count.index], "rsa_bits")
}

resource "tls_self_signed_cert" "this" {
  count                 = length(var.tls_self_signed_cert)
  allowed_uses          = lookup(var.tls_self_signed_cert[count.index], "allowed_yses")
  private_key_pem       = join("/", [path.cwd, "certificates", lookup(var.tls_self_signed_cert[count.index], "private_key_pem")])
  validity_period_hours = lookup(var.tls_self_signed_cert[count.index], "validity_period_hours")
  dns_names             = lookup(var.tls_self_signed_cert[count.index], "dns_names")
  early_renewal_hours   = lookup(var.tls_self_signed_cert[count.index], "early_renewal_hours")
  ip_addresses          = lookup(var.tls_self_signed_cert[count.index], "ip_addresses")
  is_ca_certificate     = lookup(var.tls_self_signed_cert[count.index], "is_ca_certificate")
  set_authority_key_id  = lookup(var.tls_self_signed_cert[count.index], "set_authority_key_id")
  set_subject_key_id    = lookup(var.tls_self_signed_cert[count.index], "set_subject_key_id")
  uris                  = lookup(var.tls_self_signed_cert[count.index], "uris")

  dynamic "subject" {
    for_each = lookup(var.tls_self_signed_cert[count.index], "subject") == null ? [] : ["subject"]
    content {
      common_name         = lookup(subject.value, "common_name")
      country             = lookup(subject.value, "country")
      locality            = lookup(subject.value, "locality")
      organization        = lookup(subject.value, "organization")
      organizational_unit = lookup(subject.value, "organizational_unit")
      postal_code         = lookup(subject.value, "postal_code")
      province            = lookup(subject.value, "province")
      serial_number       = lookup(subject.value, "serial_number")
      street_address      = lookup(subject.value, "street_address")
    }
  }
}

resource "tls_cert_request" "this" {
  count           = length(var.tls_cert_request)
  private_key_pem = join("/", [path.cwd, "certificates", lookup(var.tls_cert_request[count.index], "private_key_pem")])
  dns_names       = lookup(var.tls_cert_request[count.index], "dns_names")
  ip_addresses    = lookup(var.tls_cert_request[count.index], "ip_addresses")
  uris            = lookup(var.tls_cert_request[count.index], "uris")

  dynamic "subject" {
    for_each = lookup(var.tls_cert_request[count.index], "subject") == null ? [] : ["subject"]
    content {
      common_name         = lookup(subject.value, "common_name")
      country             = lookup(subject.value, "country")
      locality            = lookup(subject.value, "locality")
      organization        = lookup(subject.value, "organization")
      organizational_unit = lookup(subject.value, "organizational_unit")
      postal_code         = lookup(subject.value, "postal_code")
      province            = lookup(subject.value, "province")
      serial_number       = lookup(subject.value, "serial_number")
      street_address      = lookup(subject.value, "street_address")
    }
  }
}