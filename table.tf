resource "aws_cloudwatch_metric_alarm" "over_read_capacity" {
  alarm_name        = "${var.alarm_prefix}-${var.table_name}-over-consumed-read-capacity-units-${var.read_threshold}"
  alarm_description = "${var.alarm_prefix} ${var.table_name} over consumed read capacity units ${var.read_threshold}"

  dimensions = {
    TableName = "${var.table_name}"
  }

  metric_name         = "ConsumedReadCapacityUnits"
  namespace           = "AWS/DynamoDB"
  period              = "${var.read_period}"
  evaluation_periods  = "${var.read_evaluation_periods}"
  comparison_operator = "GreaterThanOrEqualToThreshold"

  statistic = "Sum"
  threshold = "${var.read_threshold}"

  alarm_actions = "${var.alarm_actions}"
}

resource "aws_cloudwatch_metric_alarm" "over_write_capacity" {
  alarm_name        = "${var.alarm_prefix}-${var.table_name}-over-consumed-write-capacity-units-${var.write_threshold}"
  alarm_description = "${var.alarm_prefix} ${var.table_name} over consumed write capacity units ${var.write_threshold}"

  dimensions = {
    TableName = "${var.table_name}"
  }

  metric_name         = "ConsumedWriteCapacityUnits"
  namespace           = "AWS/DynamoDB"
  period              = "${var.write_period}"
  evaluation_periods  = "${var.write_evaluation_periods}"
  comparison_operator = "GreaterThanOrEqualToThreshold"

  statistic = "Sum"
  threshold = "${var.write_threshold}"

  alarm_actions = "${var.alarm_actions}"
}
