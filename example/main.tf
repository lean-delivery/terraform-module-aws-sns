module "sns" {
  source = "tf-module-aws-sns/"
  name   = "My_SNS"

  topic_subscription = {
    protocol = "sqs"
    endpoint = "${module.sqs.queue_id}"
  }
}

module "sqs" {
  source               = "tf-module-aws-sqs/"
  name                 = "My_SQS_with_deadletter"
  fifo_queue           = "true"
  redrive_policy_count = 4
}
