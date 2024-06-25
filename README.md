## Requirements

| Name | Version    |
|------|------------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | \>= 1.8.5  |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | \>= 5.55.0 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | \>= 4.0.5  |

## Providers

| Name | Version    |
|------|------------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | \>= 5.55.0 |
| <a name="provider_tls"></a> [tls](#provider\_tls) | \>= 4.0.5  |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_acm_certificate.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/acm_certificate) | resource |
| [aws_acm_certificate_validation.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/acm_certificate_validation) | resource |
| [aws_acmpca_certificate.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/acmpca_certificate) | resource |
| [aws_acmpca_certificate_authority.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/acmpca_certificate_authority) | resource |
| [aws_acmpca_certificate_authority_certificate.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/acmpca_certificate_authority_certificate) | resource |
| [aws_acmpca_permission.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/acmpca_permission) | resource |
| [aws_acmpca_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/acmpca_policy) | resource |
| [aws_s3_bucket.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [tls_cert_request.this](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/cert_request) | resource |
| [tls_private_key.this](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key) | resource |
| [tls_self_signed_cert.this](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/self_signed_cert) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_acmpca_certificate"></a> [acmpca\_certificate](#input\_acmpca\_certificate) | n/a | <pre>list(object({<br>    id                             = number<br>    certificate_authority_id       = number<br>    certificate_signing_request_id = number<br>    signing_algorithm              = string<br>    template_arn                   = optional(string)<br>    validity = list(object({<br>      type  = string<br>      value = string<br>    }))<br>  }))</pre> | `[]` | no |
| <a name="input_acmpca_certificate_authority"></a> [acmpca\_certificate\_authority](#input\_acmpca\_certificate\_authority) | n/a | <pre>list(object({<br>    id                              = number<br>    enabled                         = optional(bool)<br>    key_storage_security_standard   = optional(number)<br>    permanent_deletion_time_in_days = optional(number)<br>    tags                            = optional(map(string))<br>    type                            = optional(string)<br>    usage_mode                      = optional(string)<br>    certificate_authority_configuration = list(object({<br>      key_algorithm     = string<br>      signing_algorithm = string<br>      subject = list(object({<br>        common_name                  = optional(string)<br>        country                      = optional(string)<br>        distinguished_name_qualifier = optional(string)<br>        generation_qualifier         = optional(string)<br>        given_name                   = optional(string)<br>        initials                     = optional(string)<br>        locality                     = optional(string)<br>        organization                 = optional(string)<br>        organizational_unit          = optional(string)<br>        pseudonym                    = optional(string)<br>        state                        = optional(string)<br>        surname                      = optional(string)<br>        title                        = optional(string)<br>      }))<br>    }))<br>    revocation_configuration = optional(list(object({<br>      crl_configuration = optional(list(object({<br>        expiration_in_days = optional(number)<br>        custom_cname       = optional(string)<br>        enabled            = optional(bool)<br>        s3_bucket_id       = optional(number)<br>      })), [])<br>      ocsp_configuration = optional(list(object({<br>        enabled           = optional(bool)<br>        ocsp_custom_cname = optional(string)<br>      })), [])<br>    })), [])<br>  }))</pre> | `[]` | no |
| <a name="input_acmpca_certificate_authority_certificate"></a> [acmpca\_certificate\_authority\_certificate](#input\_acmpca\_certificate\_authority\_certificate) | n/a | <pre>list(object({<br>    id                       = number<br>    certificate_id           = number<br>    certificate_authority_id = number<br>  }))</pre> | `[]` | no |
| <a name="input_acmpca_permission"></a> [acmpca\_permission](#input\_acmpca\_permission) | n/a | <pre>list(object({<br>    id                       = number<br>    actions                  = list(string)<br>    certificate_authority_id = number<br>    principal                = string<br>    source_account           = optional(string)<br>  }))</pre> | `[]` | no |
| <a name="input_acmpca_policy"></a> [acmpca\_policy](#input\_acmpca\_policy) | n/a | <pre>list(object({<br>    id          = number<br>    resource_id = number<br>  }))</pre> | `[]` | no |
| <a name="input_certificate"></a> [certificate](#input\_certificate) | n/a | <pre>list(object({<br>    id                        = number<br>    domain_name               = string<br>    subject_alternative_names = optional(string)<br>    validation_method         = optional(string)<br>    certificate_authority_arn = optional(number)<br>    private_key               = optional(number)<br>    certificate_body          = optional(number)<br>    key_algorithm             = optional(string)<br>    certificate_chain         = optional(string)<br>    early_renewal_duration    = optional(string)<br>    tags                      = optional(map(string))<br>  }))</pre> | `[]` | no |
| <a name="input_certificate_validation"></a> [certificate\_validation](#input\_certificate\_validation) | n/a | <pre>list(object({<br>    id                      = number<br>    certificate_id          = number<br>    validation_record_fqdns = optional(list(string))<br>  }))</pre> | `[]` | no |
| <a name="input_policy_document"></a> [policy\_document](#input\_policy\_document) | n/a | `string` | `null` | no |
| <a name="input_s3_bucket"></a> [s3\_bucket](#input\_s3\_bucket) | n/a | <pre>list(object({<br>    id                  = number<br>    bucket              = optional(string)<br>    bucket_prefix       = optional(string)<br>    force_destroy       = optional(bool)<br>    object_lock_enabled = optional(bool)<br>    tags                = optional(map(string))<br>  }))</pre> | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `map(string)` | `{}` | no |
| <a name="input_tls_cert_request"></a> [tls\_cert\_request](#input\_tls\_cert\_request) | n/a | <pre>list(object({<br>    id              = number<br>    private_key_pem = string<br>    dns_names       = optional(list(string))<br>    ip_addresses    = optional(list(string))<br>    uris            = optional(list(string))<br>    subject = optional(list(object({<br>      common_name         = optional(string)<br>      country             = optional(string)<br>      locality            = optional(string)<br>      organization        = optional(string)<br>      organizational_unit = optional(string)<br>      postal_code         = optional(string)<br>      province            = optional(string)<br>      serial_number       = optional(string)<br>      street_address      = optional(list(string))<br>    })), [])<br>  }))</pre> | `[]` | no |
| <a name="input_tls_private_key"></a> [tls\_private\_key](#input\_tls\_private\_key) | n/a | <pre>list(object({<br>    id          = number<br>    algorithm   = string<br>    ecdsa_curve = optional(string)<br>    rsa_bits    = optional(number)<br>  }))</pre> | `[]` | no |
| <a name="input_tls_self_signed_cert"></a> [tls\_self\_signed\_cert](#input\_tls\_self\_signed\_cert) | n/a | <pre>list(object({<br>    id                    = number<br>    allowed_uses          = list(string)<br>    private_key_pem       = string<br>    validity_period_hours = number<br>    dns_names             = optional(list(string))<br>    early_renewal_hours   = optional(number)<br>    ip_addresses          = optional(list(string))<br>    is_ca_certificate     = optional(bool)<br>    set_authority_key_id  = optional(bool)<br>    set_subject_key_id    = optional(bool)<br>    uris                  = optional(list(string))<br>    subject = optional(list(object({<br>      common_name         = optional(string)<br>      country             = optional(string)<br>      locality            = optional(string)<br>      organization        = optional(string)<br>      organizational_unit = optional(string)<br>      postal_code         = optional(string)<br>      province            = optional(string)<br>      serial_number       = optional(string)<br>      street_address      = optional(list(string))<br>    })), [])<br>  }))</pre> | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_acm_certificate_arn"></a> [acm\_certificate\_arn](#output\_acm\_certificate\_arn) | n/a |
| <a name="output_acm_certificate_id"></a> [acm\_certificate\_id](#output\_acm\_certificate\_id) | n/a |
| <a name="output_acm_certificate_validation_certificate_arn"></a> [acm\_certificate\_validation\_certificate\_arn](#output\_acm\_certificate\_validation\_certificate\_arn) | n/a |
| <a name="output_acm_certificate_validation_id"></a> [acm\_certificate\_validation\_id](#output\_acm\_certificate\_validation\_id) | n/a |
| <a name="output_acmpca_certificate_arn"></a> [acmpca\_certificate\_arn](#output\_acmpca\_certificate\_arn) | n/a |
| <a name="output_acmpca_certificate_authority_arn"></a> [acmpca\_certificate\_authority\_arn](#output\_acmpca\_certificate\_authority\_arn) | n/a |
| <a name="output_acmpca_certificate_authority_id"></a> [acmpca\_certificate\_authority\_id](#output\_acmpca\_certificate\_authority\_id) | n/a |
| <a name="output_acmpca_certificate_id"></a> [acmpca\_certificate\_id](#output\_acmpca\_certificate\_id) | n/a |
