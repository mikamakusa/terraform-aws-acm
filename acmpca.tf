resource "aws_acmpca_certificate" "this" {
  count                       = length(var.acmpca_certificate_authority) == 0 ? 0 : length(var.acmpca_certificate)
  certificate_authority_arn   = try(element(aws_acmpca_certificate_authority.this.*.arn, lookup(var.acmpca_certificate[count.index], "certificate_authority_id")))
  certificate_signing_request = try(element(tls_cert_request.this.*.cert_request_pem, lookup(var.acmpca_certificate[count.index], "certificate_signing_request_id")))
  signing_algorithm           = lookup(var.acmpca_certificate[count.index], "signing_algorithm")
  template_arn                = lookup(var.acmpca_certificate[count.index], "template_arn")

  dynamic "validity" {
    for_each = lookup(var.acmpca_certificate[count.index], "validity")
    content {
      type  = lookup(validity.value, "type")
      value = lookup(validity.value, "value")
    }
  }
}

resource "aws_acmpca_certificate_authority" "this" {
  count                           = length(var.acmpca_certificate_authority)
  enabled                         = lookup(var.acmpca_certificate_authority[count.index], "enabled")
  key_storage_security_standard   = lookup(var.acmpca_certificate_authority[count.index], "key_storage_security_standard")
  permanent_deletion_time_in_days = lookup(var.acmpca_certificate_authority[count.index], "permanent_deletion_time_in_days")
  tags                            = lookup(var.acmpca_certificate_authority[count.index], "tags")
  type                            = lookup(var.acmpca_certificate_authority[count.index], "type")
  usage_mode                      = lookup(var.acmpca_certificate_authority[count.index], "usage_mode")

  dynamic "certificate_authority_configuration" {
    for_each = lookup(var.acmpca_certificate_authority[count.index], "certificate_authority_configuration")
    content {
      dynamic "subject" {
        for_each = lookup(certificate_authority_configuration.value, "subject")
        content {
          common_name                  = lookup(subject.value, "common_name")
          country                      = lookup(subject.value, "country")
          distinguished_name_qualifier = lookup(subject.value, "distinguished_name_qualifier")
          generation_qualifier         = lookup(subject.value, "generation_qualifier")
          given_name                   = lookup(subject.value, "given_name")
          initials                     = lookup(subject.value, "initials")
          locality                     = lookup(subject.value, "locality")
          organization                 = lookup(subject.value, "organization")
          organizational_unit          = lookup(subject.value, "organizational_unit")
          pseudonym                    = lookup(subject.value, "pseudonym")
          state                        = lookup(subject.value, "state")
          surname                      = lookup(subject.value, "surname")
          title                        = lookup(subject.value, "title")
        }
      }
      key_algorithm     = lookup(certificate_authority_configuration.value, "key_algorithm")
      signing_algorithm = lookup(certificate_authority_configuration.value, "signing_algorithm")
    }
  }

  dynamic "revocation_configuration" {
    for_each = lookup(var.acmpca_certificate_authority[count.index], "revocation_configuration") == null ? [] : ["revocation_configuration"]
    content {
      dynamic "crl_configuration" {
        for_each = try(lookup(revocation_configuration.value, "crl_configuration")) == null ? [] : ["crl_configuration"]
        content {
          expiration_in_days = lookup(crl_configuration.value, "expiration_in_days")
          custom_cname       = lookup(crl_configuration.value, "custom_cname")
          enabled            = lookup(crl_configuration.value, "enabled")
          s3_bucket_name     = lookup(crl_configuration.value, "enabled") != true ? null : try(element(aws_s3_bucket.this.bucket, lookup(crl_configuration.value, "s3_bucket_id")))
        }
      }
      dynamic "ocsp_configuration" {
        for_each = try(lookup(revocation_configuration.value, "ocsp_configuration")) == null ? [] : ["ocsp_configuration"]
        content {
          enabled           = lookup(ocsp_configuration.value, "enabled")
          ocsp_custom_cname = lookup(ocsp_configuration.value, "ocsp_custom_name")
        }
      }
    }
  }
}

resource "aws_acmpca_certificate_authority_certificate" "this" {
  count                     = (length(var.acmpca_certificate_authority) && length(var.acmpca_certificate)) == 0 ? 0 : length(var.acmpca_certificate_authority_certificate)
  certificate               = try(element(aws_acmpca_certificate.this.*.certificate, lookup(var.acmpca_certificate_authority_certificate[count.index], "certificate_id")))
  certificate_authority_arn = try(element(aws_acmpca_certificate_authority.this.*.arn, lookup(var.acmpca_certificate_authority_certificate[count.index], "certificate_authority_id")))
  certificate_chain         = try(element(aws_acmpca_certificate.this.*.certificate_chain, lookup(var.acmpca_certificate_authority_certificate[count.index], "certificate_id")))
}

resource "aws_acmpca_permission" "this" {
  count                     = length(var.acmpca_certificate_authority) == 0 ? 0 : length(var.acmpca_permission)
  actions                   = lookup(var.acmpca_permission[count.index], "actions")
  certificate_authority_arn = try(element(aws_acmpca_certificate_authority.this.*.arn, lookup(var.acmpca_permission[count.index], "certificate_authority_id")))
  principal                 = lookup(var.acmpca_permission[count.index], "principal")
  source_account            = lookup(var.acmpca_permission[count.index], "source_account")
}

resource "aws_acmpca_policy" "this" {
  count        = length(var.acmpca_certificate_authority) == 0 ? 0 : length(var.acmpca_policy)
  policy       = var.policy_document
  resource_arn = try(element(aws_acmpca_certificate_authority.this.*.arn, lookup(var.acmpca_policy[count.index], "resource_id")))
}