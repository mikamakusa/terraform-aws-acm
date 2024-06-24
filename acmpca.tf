resource "aws_acmpca_certificate" "this" {
  count                       = length(var.acmpca_certificate_authority) == 0 ? 0 : length(var.acmpca_certificate)
  certificate_authority_arn   = ""
  certificate_signing_request = ""
  signing_algorithm           = ""
  template_arn = ""

  dynamic "validity" {
    for_each = ""
    content {
      type  = ""
      value = ""
    }
  }
}

resource "aws_acmpca_certificate_authority" "this" {
  count = length(var.acmpca_certificate_authority)
  enabled = true
  key_storage_security_standard = 1
  permanent_deletion_time_in_days = 1
  tags = {}
  type = ""
  usage_mode = ""

  dynamic "certificate_authority_configuration" {
    for_each = ""
    content {
      key_algorithm     = ""
      signing_algorithm = ""
    }
  }

  dynamic "revocation_configuration" {
    for_each = ""
    content {
      crl_configuration {
        expiration_in_days = 0
        custom_cname = ""
        enabled = true
        s3_bucket_name = ""
      }
    }
  }
}

resource "aws_acmpca_certificate_authority_certificate" "this" {
  count                     = length(var.acmpca_certificate_authority) == 0 ? 0 : length(var.acmpca_certificate_authority_certificate)
  certificate               = ""
  certificate_authority_arn = ""
}

resource "aws_acmpca_permission" "this" {
  count                     = length(var.acmpca_certificate_authority) == 0 ? 0 : length(var.acmpca_permission)
  actions                   = []
  certificate_authority_arn = ""
  principal                 = ""
}

resource "aws_acmpca_policy" "this" {
  count        = length(var.acmpca_certificate_authority) == 0 ? 0 : length(var.acmpca_policy)
  policy       = var.policy_document
  resource_arn = try(element(aws_acmpca_certificate_authority.this.*.arn, lookup(var.acmpca_policy[count.index], "resource_id")))
}