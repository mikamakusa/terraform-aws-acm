variable "certificate" {
  type = list(object({
    id                        = number
    domain_name               = string
    subject_alternative_names = optional(string)
    validation_method         = optional(string)
    certificate_authority_arn = optional(number)
    private_key               = optional(number)
    certificate_body          = optional(number)
    key_algorithm             = optional(string)
    certificate_chain         = optional(string)
    early_renewal_duration    = optional(string)
    tags                      = optional(map(string))
  }))
  default = []
}

variable "tls_private_key" {
  type = list(object({
    id          = number
    algorithm   = string
    ecdsa_curve = optional(string)
    rsa_bits    = optional(number)
  }))
  default = []
}

variable "tls_self_signed_cert" {
  type = list(object({
    id                    = number
    allowed_uses          = list(string)
    private_key_pem_id    = number
    validity_period_hours = number
    dns_names             = optional(list(string))
    early_renewal_hours   = optional(number)
    ip_addresses          = optional(list(string))
    is_ca_certificate     = optional(bool)
    set_authority_key_id  = optional(bool)
    set_subject_key_id    = optional(bool)
    uris                  = optional(list(string))
    subject = optional(list(object({
      common_name         = optional(string)
      country             = optional(string)
      locality            = optional(string)
      organization        = optional(string)
      organizational_unit = optional(string)
      postal_code         = optional(string)
      province            = optional(string)
      serial_number       = optional(string)
      street_address      = optional(list(string))
    })), [])
  }))
  default = []
}

variable "tls_cert_request" {
  type = list(object({
    id              = number
    private_key_pem = string
    dns_names       = optional(list(string))
    ip_addresses    = optional(list(string))
    uris            = optional(list(string))
    subject = optional(list(object({
      common_name         = optional(string)
      country             = optional(string)
      locality            = optional(string)
      organization        = optional(string)
      organizational_unit = optional(string)
      postal_code         = optional(string)
      province            = optional(string)
      serial_number       = optional(string)
      street_address      = optional(list(string))
    })), [])
  }))
  default = []
}

variable "certificate_validation" {
  type = list(object({
    id                      = number
    certificate_id          = number
    validation_record_fqdns = optional(list(string))
  }))
  default = []
}

variable "acmpca_certificate" {
  type = list(object({
    id                             = number
    certificate_authority_id       = number
    certificate_signing_request_id = number
    signing_algorithm              = string
    template_arn                   = optional(string)
    validity = list(object({
      type  = string
      value = string
    }))
  }))
  default = []
}

variable "acmpca_certificate_authority" {
  type = list(object({
    id                              = number
    enabled                         = optional(bool)
    key_storage_security_standard   = optional(number)
    permanent_deletion_time_in_days = optional(number)
    tags                            = optional(map(string))
    type                            = optional(string)
    usage_mode                      = optional(string)
    certificate_authority_configuration = list(object({
      key_algorithm     = string
      signing_algorithm = string
      subject = list(object({
        common_name                  = optional(string)
        country                      = optional(string)
        distinguished_name_qualifier = optional(string)
        generation_qualifier         = optional(string)
        given_name                   = optional(string)
        initials                     = optional(string)
        locality                     = optional(string)
        organization                 = optional(string)
        organizational_unit          = optional(string)
        pseudonym                    = optional(string)
        state                        = optional(string)
        surname                      = optional(string)
        title                        = optional(string)
      }))
    }))
    revocation_configuration = optional(list(object({
      crl_configuration = optional(list(object({
        expiration_in_days = optional(number)
        custom_cname       = optional(string)
        enabled            = optional(bool)
        s3_bucket_id       = optional(number)
      })), [])
      ocsp_configuration = optional(list(object({
        enabled           = optional(bool)
        ocsp_custom_cname = optional(string)
      })), [])
    })), [])
  }))
  default = []
}

variable "acmpca_certificate_authority_certificate" {
  type = list(object({
    id                       = number
    certificate_id           = number
    certificate_authority_id = number
  }))
  default = []
}

variable "acmpca_permission" {
  type = list(object({
    id                       = number
    actions                  = list(string)
    certificate_authority_id = number
    principal                = string
    source_account           = optional(string)
  }))
  default = []
}

variable "policy_document" {
  type     = string
  default  = null
  nullable = true
}

variable "acmpca_policy" {
  type = list(object({
    id          = number
    resource_id = number
  }))
  default = []
}

variable "s3_bucket" {
  type = list(object({
    id                  = number
    bucket              = optional(string)
    bucket_prefix       = optional(string)
    force_destroy       = optional(bool)
    object_lock_enabled = optional(bool)
    tags                = optional(map(string))
  }))
  default = []
}

variable "tags" {
  type    = map(string)
  default = {}
}