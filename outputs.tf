output "acm_certificate_id" {
  value = try(aws_acm_certificate.this.*.id)
}

output "acm_certificate_arn" {
  value = try(aws_acm_certificate.this.*.arn)
}

output "acm_certificate_validation_id" {
  value = try(aws_acm_certificate_validation.this.*.id)
}

output "acm_certificate_validation_certificate_arn" {
  value = try(aws_acm_certificate_validation.this.*.certificate_arn)
}

output "acmpca_certificate_id" {
  value = try(aws_acmpca_certificate.this.*.id)
}

output "acmpca_certificate_arn" {
  value = try(aws_acmpca_certificate.this.*.arn)
}

output "acmpca_certificate_authority_id" {
  value = try(aws_acmpca_certificate_authority.this.*.id)
}

output "acmpca_certificate_authority_arn" {
  value = try(aws_acmpca_certificate_authority.this.*.arn)
}