resource "aws_acm_certificate" "this" {
  count                     = length(var.certificate)
  domain_name               = lookup(var.certificate[count.index], "domain_name")
  subject_alternative_names = [lookup(var.certificate[count.index], "subject_alternative_names")]
  validation_method         = lookup(var.certificate[count.index], "validation_method")
  certificate_authority_arn = lookup(var.certificate[count.index], "validation_method")
  private_key               = lookup(var.certificate[count.index], "validation_method")
  certificate_body          = lookup(var.certificate[count.index], "validation_method")
  key_algorithm             = ""
  certificate_chain         = ""
  early_renewal_duration    = ""
  tags                      = {}

  dynamic "options" {
    for_each = lookup(var.certificate[count.index], "options")
    content {
      certificate_transparency_logging_preference = lookup(options.value, "certificate_transparency_logging_preference")
    }
  }

  dynamic "validation_option" {
    for_each = ""
    content {
      domain_name       = ""
      validation_domain = ""
    }
  }
}

resource "aws_acm_certificate_validation" "this" {
  count                   = length(var.certificate) == 0 ? 0 : length(var.certificate_validation)
  certificate_arn         = try(element(aws_acm_certificate.this.*.arn, lookup(var.certificate_validation[count.index], "certificate_id")))
  validation_record_fqdns = lookup(var.certificate_validation[count.index], "validation_record_fqdns")
}