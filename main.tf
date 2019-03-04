locals {
  default_tags = {
    Name        = "${var.project}-${var.environment}"
    Environment = "${var.environment}"
    Project     = "${var.project}"
  }
}

resource "aws_sns_topic" "this" {
  name                                  = "${ var.name == "" ? local.default_tags["Name"] : var.name }"
  display_name                          = "${var.display_name}"
  delivery_policy                       = "${var.delivery_policy}"
  kms_master_key_id                     = "${var.kms_master_key_id}"
  application_success_feedback_role_arn = "${var.application_success_feedback_role_arn}"
  application_failure_feedback_role_arn = "${var.application_failure_feedback_role_arn}"
  http_success_feedback_role_arn        = "${var.http_success_feedback_role_arn}"
  http_failure_feedback_role_arn        = "${var.http_failure_feedback_role_arn}"
  lambda_success_feedback_role_arn      = "${var.lambda_success_feedback_role_arn}"
  lambda_failure_feedback_role_arn      = "${var.lambda_failure_feedback_role_arn}"
  sqs_success_feedback_role_arn         = "${var.sqs_success_feedback_role_arn}"
  sqs_failure_feedback_role_arn         = "${var.sqs_failure_feedback_role_arn}"
}

resource "aws_sns_topic_subscription" "this" {
  count     = "${ var.topic_subscription["protocol"] != "" ? 1 : 0 }"
  endpoint  = "${var.topic_subscription["endpoint"]}"
  protocol  = "${var.topic_subscription["protocol"]}"
  topic_arn = "${aws_sns_topic.this.arn}"

  endpoint_auto_confirms          = "${var.endpoint_auto_confirms}"
  confirmation_timeout_in_minutes = "${var.confirmation_timeout_in_minutes}"
  raw_message_delivery            = "${var.raw_message_delivery}"
}

data "aws_iam_policy_document" "sns-topic-policy" {
  statement {
    actions = [
      "SNS:Publish",
    ]

    condition = {
      test     = "ArnLike"
      variable = "aws:SourceArn"
      values   = ["*"]
    }

    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = ["*"]
    }

    resources = [
      "${aws_sns_topic.this.arn}",
    ]
  }
}

resource "aws_sns_topic_policy" "this" {
  arn    = "${aws_sns_topic.this.arn}"
  policy = "${ var.policy != "" ? var.policy : data.aws_iam_policy_document.sns-topic-policy.json}"
}
