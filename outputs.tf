output "id" {
  value       = "${aws_sns_topic.this.id}"
  description = "The ARN of the aws sns topic"
}

output "arn" {
  value       = "${aws_sns_topic.this.arn}"
  description = "The ARN of the aws sns topic"
}

output "subscription_id" {
  value       = "${local.subscription_id}"
  description = "The ARN of the subscription"
}

output "subscription_protocol" {
  value       = "${local.subscription_protocol}"
  description = "The protocol being used"
}

output "subscription_endpoint" {
  value       = "${local.subscription_endpoint}"
  description = "The full endpoint to send data to SQS ARN HTTP HTTPS URL Application ARN SMS number etc."
}

output "subscription_arn" {
  value       = "${local.subscription_arn}"
  description = "The ARN of the subscription stored as a more user-friendly property"
}
