output "id" {
  value       = "${module.sns.id}"
  description = "The ARN of the aws sns topic"
}

output "arn" {
  value       = "${module.sns.arn}"
  description = "The ARN of the aws sns topic"
}

output "subscription_id" {
  value       = "${module.sns.subscription_id}"
  description = "The ARN of the subscription"
}

output "subscription_protocol" {
  value       = "${module.sns.subscription_protocol}"
  description = "The protocol being used"
}

output "subscription_endpoint" {
  value       = "${module.sns.subscription_endpoint}"
  description = "The full endpoint to send data to SQS ARN HTTP HTTPS URL Application ARN SMS number etc."
}

output "subscription_arn" {
  value       = "${module.sns.subscription_arn}"
  description = "The ARN of the subscription stored as a more user-friendly property"
}

output "account_id" {
  value = "${data.aws_caller_identity.current.account_id}"
}

output "caller_arn" {
  value = "${data.aws_caller_identity.current.arn}"
}

output "caller_user" {
  value = "${data.aws_caller_identity.current.user_id}"
}
