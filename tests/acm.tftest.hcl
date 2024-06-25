run "setup_tests" {
  module {
    source = "./tests/setup"
  }
}

run "email_validation_certificate" {
  command = [init,plan,apply]

  variables {
    certificate = [
      {
        id                = 0
        domain_name       = "example.com"
        validation_method = "EMAIL"
      }
    ]
    certificate_validation = [
      {
        id              = 0
        certificate_id  = 0
      }
    ]
  }
}

run "" {
  command = [init,plan,apply]

  variables {
    tls_private_key = [
      {
        id        = 0
        aldorithm = "RSA"
      }
    ]
    tls_cert_request = [
      {
        id                    = 0
        private_key_pem_id    = 0
        early_renewal_hours   = 5
        is_ca_certificate     = true
        set_authority_key_id  = true
        subject = [
          {
            common_name = "test1"
          }
        ]
      }
    ]
    acmpca_certificate_authority = [
      {
        id = 0
        certificate_authority_configuration = [
          {
          key_algorithm     = "RSA_4096"
          signing_algorithm = "SHA512WITHRSA"

          subject = [
              {
                common_name = "example.com"
              }
            ]
          }
        ]
        permanent_deletion_time_in_days = 7
      }
    ]
    acmpca_certificate = [
      {
        id                              = 0
        certificate_authority_id        = 0
        certificate_signing_request_id  = 0
        signing_algorithm               = "SHA256WITHRSA"
        validity = [
          {
            type  = "YEARS"
            value = 1
          }
        ]
      }
    ]
  }
}