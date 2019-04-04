provider "aws" {
  region = "${var.region}"
}

data "aws_caller_identity" "current" {}

module "sns" {
  source                                   = "../"
  project                                  = "${var.project}"
  environment                              = "${var.environment}"
  tags                                     = "${var.tags}"
  name                                     = "${var.name}"
  display_name                             = "${var.display_name}"
  policy                                   = "${var.policy}"
  delivery_policy                          = "${var.delivery_policy}"
  application_success_feedback_role_arn    = "${var.application_success_feedback_role_arn}"
  application_success_feedback_sample_rate = "${var.application_success_feedback_sample_rate}"
  application_failure_feedback_role_arn    = "${var.application_failure_feedback_role_arn}"
  http_success_feedback_role_arn           = "${var.http_success_feedback_role_arn}"
  http_success_feedback_sample_rate        = "${var.http_success_feedback_sample_rate}"
  http_failure_feedback_role_arn           = "${var.http_failure_feedback_role_arn}"
  kms_master_key_id                        = "${var.kms_master_key_id}"
  lambda_success_feedback_role_arn         = "${var.lambda_success_feedback_role_arn}"
  lambda_success_feedback_sample_rate      = "${var.lambda_success_feedback_sample_rate}"
  lambda_failure_feedback_role_arn         = "${var.lambda_failure_feedback_role_arn}"
  sqs_success_feedback_role_arn            = "${var.sqs_success_feedback_role_arn}"
  sqs_success_feedback_sample_rate         = "${var.sqs_success_feedback_sample_rate}"
  sqs_failure_feedback_role_arn            = "${var.sqs_failure_feedback_role_arn}"
  topic_subscription                       = "${var.topic_subscription}"
  endpoint_auto_confirms                   = "${var.endpoint_auto_confirms}"
  confirmation_timeout_in_minutes          = "${var.confirmation_timeout_in_minutes}"
  raw_message_delivery                     = "${var.raw_message_delivery}"
}
