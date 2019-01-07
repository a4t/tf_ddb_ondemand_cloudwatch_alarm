resource "aws_cloudwatch_metric_alarm" "over_gsi_read_capacity" {
  count             = "${length(var.gsi)}"
  alarm_name        = "dynamodb-${var.table_name}-gsi-${lookup(var.gsi[count.index], "name")}-over-consumed-read-capacity-units-${lookup(var.gsi[count.index], "read_threshold")}"
  alarm_description = "dynamodb ${var.table_name} over consumed read capacity units ${var.read_threshold}"

  dimensions = {
    GlobalSecondaryIndexName = "${lookup(var.gsi[count.index], "name")}"
    TableName                = "${var.table_name}"
  }

  metric_name         = "ConsumedReadCapacityUnits"
  namespace           = "AWS/DynamoDB"
  period              = "${lookup(var.gsi[count.index], "read_period")}"
  evaluation_periods  = "${lookup(var.gsi[count.index], "read_evaluation_periods")}"
  comparison_operator = "GreaterThanOrEqualToThreshold"

  statistic = "Sum"
  threshold = "${lookup(var.gsi[count.index], "read_threshold")}"

  alarm_actions = "${var.alarm_actions}"
}

resource "aws_cloudwatch_metric_alarm" "over_gsi_write_capacity" {
  count             = "${length(var.gsi)}"
  alarm_name        = "dynamodb-${var.table_name}-gsi-${lookup(var.gsi[count.index], "name")}-over-consumed-write-capacity-units-${lookup(var.gsi[count.index], "write_threshold")}"
  alarm_description = "dynamodb ${var.table_name} over consumed write capacity units ${var.write_threshold}"

  dimensions = {
    GlobalSecondaryIndexName = "${lookup(var.gsi[count.index], "name")}"
    TableName                = "${var.table_name}"
  }

  metric_name         = "ConsumedWriteCapacityUnits"
  namespace           = "AWS/DynamoDB"
  period              = "${lookup(var.gsi[count.index], "write_period")}"
  evaluation_periods  = "${lookup(var.gsi[count.index], "write_evaluation_periods")}"
  comparison_operator = "GreaterThanOrEqualToThreshold"

  statistic = "Sum"
  threshold = "${lookup(var.gsi[count.index], "write_threshold")}"

  alarm_actions = "${var.alarm_actions}"
}
